include: "./base_trends.view"

view: global_top_terms {
  extends: [base_trends]
  label: "Google Trends - Global Top Terms"

  # --- Derived Table (Unions US & International Data) ---
  # This SQL unions the US-only 'top_terms' table with the
  # 'international_top_terms' table to create a single global source.
  # It uses a parameter to filter by country for performance.
  derived_table: {
    sql: WITH global AS (
        WITH international AS (SELECT
            refresh_date,
            week,
            rank,
            score,
            term,
            country_code,
            country_name,
            region_code,
            region_name,
          FROM
            `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.international_top_terms`
          WHERE
              {% condition dynamic_country %} country_code {% endcondition %}
            ), local AS (
              SELECT
                refresh_date,
                week,
                rank,
                score,
                term,
                'US' as country_code,
                'United States' as country_name,
                CAST(dma_id AS STRING) as region_code,
                dma_name AS region_name,
              FROM
                `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.top_terms`
              WHERE {% condition dynamic_country %} 'US' {% endcondition %}
              )

            SELECT * fROM international
            UNION ALL
            SELECT * FROM local
            ), MAX_DATES AS (
              SELECT MAX(refresh_date) AS max_refresh_date,
                     MAX(week) AS max_week
              FROM global
            )
            SELECT
              GENERATE_UUID() as primary_key,
              *
            FROM global CROSS JOIN MAX_DATES;;
  }

  # --- Overridden Dimensions ---
  # The 'term' dimension is inherited from base_trends

  dimension: term {
    link: {
      label: "Term Analysis Dashboard"
      url: "/dashboards/google_trends::global_term_analysis?Is+Latest+Refresh+Week+%28Yes+%2F+No%29=Yes&Is+Latest+Week+%28Yes+%2F+No%29={{ _filters['global_top_terms.is_latest_week'] | encode_uri }}&Week={{ _filters['global_top_terms.week_cat'] | encode_uri }}&Country={{ _filters['global_top_terms.dynamic_country'] | encode_uri }}&Term=%25{{ value }}%25&Region+Name={{ _filters['global_top_terms.region_name'] | encode_uri }}&Term+is={{ value }}&Similar=%25{{ value | encode_uri }}%25%2C%25{% assign words = value | split: ' ' %}{{ words[0] | encode_uri }}%25%2C%25{{ words | last | encode_uri }}%25"
    }
  }

  # --- Group: Helper Dimensions (Hidden) ---
  # These fields are used for the logic in the main 'Geography'
  # dimensions but should not be used directly in explores.

  dimension: max_refresh_date {
    group_label: "Helper Dimensions"
    sql: ${TABLE}.max_refresh_date ;;
  }

  dimension: max_week {
    group_label: "Helper Dimensions"
    sql: ${TABLE}.max_week ;;
  }


  dimension: is_past_week {
    group_label: "Filters"
    label: "Is Past Week"
    description: "Indicates if the date belongs to the previous completed week (Sun-Sat)."
    hidden: no
    type: yesno
    sql: ${week_date} >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), WEEK), INTERVAL 1 WEEK)
      AND ${week_date} < DATE_TRUNC(CURRENT_DATE(), WEEK) ;;
  }

  dimension: is_latest_week {
    group_label: "Filters"
    label: "Is Latest Week"
    description: "Indicates if this row belongs to the most recent week
    available in the data (based on week)."
    hidden: no
    type: yesno
    sql: ${week_date} = DATE_TRUNC(${TABLE}.max_week, WEEK) ;;
  }

  dimension: is_latest_refresh_date {
    group_label: "Filters"
    label: "Is Latest Refresh Week"
    description: "Indicates if this row belongs to the most recent snapshot
    available in the data (based on refresh_week)."
    hidden: no
    type: yesno
    sql: ${refresh_date} = ${TABLE}.max_refresh_date ;;
  }

  parameter: dynamic_region {
    type: string
    suggest_dimension: region_name
    # hidden: no
  }

  dimension: reference_metric_value {
    type: number
    hidden: yes

    sql:
          (
            SELECT
              AVG(${score})
            FROM
              ${TABLE}
            WHERE
              ${region_name} = {% parameter ${dynamic_region} %}


              {% if global_top_terms.is_latest_refresh_date._is_filtered %}
                AND refresh_date = ${max_refresh_date}
              {% endif %}

              {% if global_top_terms.is_latest_week._is_filtered %}
                AND ${week_date} = ${max_week}
              {% endif %}

              {% if global_top_terms.week_cat._is_filtered %}
                AND {% condition week_date %} global_top_terms.week_cat {% endcondition %}
              {% endif %}

              {% if global_top_terms.term._is_filtered %}
               AND {% condition term %} global_top_terms.term {% endcondition %}
              {% endif %}

          )
        ;;
    }

  measure: percent_difference_vs_reference {
    type: number
    label: "Percent Difference vs {{ dynamic_region._parameter_value }}"
    value_format_name: percent_2
    hidden: no
    sql:
          SAFE_DIVIDE(
            ${avg_score} - ${reference_metric_value},
            ${reference_metric_value}
          )
        ;;
  }

}
