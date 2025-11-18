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
              FROM `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.top_terms`
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
      url: "/dashboards/google_trends::global_term_analysis?Is+Latest+Refresh+Week+%28Yes+%2F+No%29=Yes&Is+Latest+Week+%28Yes+%2F+No%29={{ _filters['global_top_terms.is_latest_week'] | encode_uri }}&Week+Cat={{ _filters['global_top_terms.week_cat'] | encode_uri }}&Country={{ _filters['global_top_terms.dynamic_country'] | encode_uri }}&Term=%25{{ value }}%25&Region+Name={{ _filters['global_top_terms.region_name'] | encode_uri }}&Term+is={{ value }}&Similar=%25{{ value | encode_uri }}%25%2C%25{% assign words = value | split: ' ' %}{{ words[0] | encode_uri }}%25%2C%25{{ words | last | encode_uri }}%25"
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

  # --- Group: Geography ---

  dimension: country_code {
    group_label: "Geography"
    label: "Country Code"
    description: "Two-letter ISO code for the country (e.g., 'US', 'GB')."
    type: string
    sql: ${TABLE}.country_code ;;
    hidden: no
    map_layer_name: countries
  }

  dimension: country_name {
    group_label: "Geography"
    label: "Country Name"
    description: "Full name of the country (e.g., 'United States', 'United Kingdom')."
    type: string
    sql: ${TABLE}.country_name ;;
    hidden: no
  }

  dimension: region_name {
    group_label: "Geography"
    label: "Region Name"
    description: "The name of the sub-region. Shows DMA Name for the US and Region Name for other countries."
    type: string
    hidden: no
    sql: ${TABLE}.region_name ;;
  }

  dimension: region_code {
    group_label: "Geography"
    label: "Region Code"
    description: "The code of the sub-region. Shows DMA ID for the US and Region Code for other countries."
    type: string
    hidden: no
    sql: ${TABLE}.region_code ;;
  }

  dimension: week_cat {
    hidden: no
    type: string
    sql: CAST(${TABLE}.week AS STRING) ;;
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

  dimension: refresh_date_cat {
    hidden: no
    type: string
    sql: CAST(${TABLE}.refresh_date AS STRING) ;;
  }

}
