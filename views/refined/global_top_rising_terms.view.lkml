include: "./base_trends.view"

view: global_top_rising_terms {
  extends: [base_trends]
  label: "Google Trends - Global Rising Terms"

  # --- Derived Table (Unions US & International 'Rising' Data) ---
  derived_table: {
    sql: WITH global AS (WITH us_rising AS (
      SELECT
        term,
        'US' AS country_code,
        'United States' AS country_name,
        CAST(dma_id AS STRING) AS region_code,
        dma_name AS region_name,
        week,
        refresh_date,
        percent_gain,
        score,
        rank,
      FROM
        `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.top_rising_terms`
      WHERE {% condition dynamic_country %} 'US' {% endcondition %}
    ),
    intl_rising AS (
      SELECT
        term,
        country_code,
        country_name,
        region_code,
        region_name,
        week,
        refresh_date,
        percent_gain,
        score,
        rank,
      FROM
        `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.international_top_rising_terms`
      WHERE
          {% condition dynamic_country %} country_code {% endcondition %}
    )
    SELECT * FROM us_rising
    UNION ALL
    SELECT * FROM intl_rising),

      MAX_DATES AS (
      SELECT MAX(refresh_date) AS max_refresh_date,
      MAX(week) AS max_week
      FROM `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.top_rising_terms`
      )

      SELECT
      GENERATE_UUID() as primary_key,
      *
      FROM global CROSS JOIN MAX_DATES;;
  }

  dimension: term {
    link: {
      label: "Last Month Growth"
      url: "@{VIZ_TERM_TRENDING}{{ link }}&fields={{ _view._name }}.refresh_date_cat,{{ _view._name }}.average_percent_gain&f[{{ _view._name }}.rank]=NOT+NULL&f[{{ _view._name }}.week_cat]=-NULL&f[{{ _view._name }}.refresh_date_cat]=-NULL&f[{{ _view._name }}.rising_tier]=-NULL&f[{{ _view._name }}.is_latest_week]=Yes%2CNo&f[{{ _view._name }}.is_latest_refresh_date]=Yes%2CNo&sorts={{ _view._name }}.refresh_date_cat+asc&limit=500&column_limit=50&vis_config={{ vis_config | encode_uri }}"
    }
  }

  # --- Group: Rising Details (Key Fields) ---


  dimension: percent_gain {
    group_label: "Rising Details"
    label: "% Growth (Gain)"
    description: "The percentage growth (rate) at which the term grew
    compared to the previous period. >5000% is 'Breakout'."
    hidden: no
    type: number
    sql: ${TABLE}.percent_gain ;;
  }

  dimension: rising_tier {
    group_label: "Rising Details"
    label: "Growth Tier"
    description: "Classifies rising terms by their growth magnitude."
    hidden: no
    type: string
    case: {
      when: {
        sql: ${percent_gain} > 5000 ;;
        label: "Breakout (> 5,000%)"
      }
      when: {
        sql: ${percent_gain} > 1000 ;;
        label: "Soaring (1,000% - 5,000%)"
      }
      when: {
        sql: ${percent_gain} > 250 ;;
        label: "Rising (250% - 1,000%)"
      }
      else: "Spiking (< 250%)"
    }
    drill_fields: []
    link: {
      label: "Terms By Region"
      url: "{{ link }}&fields={{ _view._name }}.term,{{ _view._name }}.avg_score,{{ _view._name }}.region_name&pivots={{ _view._name }}.term&sorts={{ _view._name }}.term,{{ _view._name }}.avg_score+desc&limit=500&column_limit=50"
    }
  }

  # --- Group: Geography (Unified Fields) ---

  dimension: country_code {
    group_label: "Geography"
    label: "Country Code"
    hidden: no
    type: string
    sql: ${TABLE}.country_code ;;
    map_layer_name: countries
  }

  dimension: country_name {
    group_label: "Geography"
    label: "Country Name"
    hidden: no
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: region_code {
    group_label: "Geography"
    label: "Region Code"
    hidden: no
    description: "DMA ID for US, Region Code for international."
    type: string
    sql: ${TABLE}.region_code ;;
  }

  dimension: region_name {
    group_label: "Geography"
    label: "Region Name"
    description: "DMA Name for US, Region Name for international."
    hidden: no
    type: string
    sql: ${TABLE}.region_name ;;
  }

  # --- Measures (Key Metrics) ---

  measure: average_percent_gain {
    group_label: "Rising Details"
    label: "Average % Growth"
    hidden: no
    type: average
    sql: ${percent_gain} ;;
    value_format_name: decimal_0
  }

  measure: max_percent_gain {
    group_label: "Rising Details"
    label: "Maximum % Growth"
    hidden: no
    type: max
    sql: ${percent_gain} ;;
    value_format_name: decimal_0
  }

  measure: count_rising_terms {
    group_label: "Rising Details"
    label: "Count of Rising Terms"
    hidden: no
    type: count_distinct
    sql: ${term} ;;
  }


  # --- Helper Dimensions (for filtering) ---
  # These fields come from the MAX_DATES CTE in the derived table

  dimension: max_refresh_date {
    group_label: "Helper Dimensions"
    label: "Max Refresh Date"
    description: "The latest refresh_date available in the data."
    type: date
    sql: ${TABLE}.max_refresh_date ;;
    convert_tz: no
  }

  dimension: max_week {
    group_label: "Helper Dimensions"
    label: "Max Week Date"
    description: "The latest week_date available in the data."
    type: date
    sql: ${TABLE}.max_week ;;
    convert_tz: no
  }

  dimension: week_cat {
    hidden: no
    type: string
    sql: CAST(${TABLE}.week AS STRING) ;;
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

  dimension: one_year_ago_week {
    type: string
    hidden: no
    sql: DATE_SUB(MAX(${TABLE}.week), INTERVAL 52 week) ;;
  }
}
