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
            CAST(NULL AS INT64) as dma_id,
            CAST(NULL AS STRING) as dma_name,
            country_code,
            country_name,
            region_code,
            region_name,
            GENERATE_UUID() as primary_key
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
                CAST(dma_id AS INT64) as dma_id,
                dma_name,
                'US' as country_code,
                'United States' as country_name,
                CAST(NULL AS STRING) as region_code,
                CAST(NULL AS STRING) as region_name,
                GENERATE_UUID() as primary_key
              FROM
                `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.top_terms`
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
            FROM global CROSS JOIN MAX_DATES
            WHERE
              {% condition dynamic_country %} global.country_code {% endcondition %} ;;
  }

  # --- Filter Parameter ---


  parameter: dynamic_country {
    group_label: "Filters"
    label: "Country"
    description: "Filter data by a specific country code (e.g., 'US', 'GB', 'MX'). Default is 'US'."
    type: unquoted
    hidden: no
    default_value: "US"

    allowed_value: { value: "AR" label: "Argentina" }
    allowed_value: { value: "AT" label: "Austria" }
    allowed_value: { value: "AU" label: "Australia" }
    allowed_value: { value: "BE" label: "Belgium" }
    allowed_value: { value: "BR" label: "Brazil" }
    allowed_value: { value: "CA" label: "Canada" }
    allowed_value: { value: "CH" label: "Switzerland" }
    allowed_value: { value: "CL" label: "Chile" }
    allowed_value: { value: "CO" label: "Colombia" }
    allowed_value: { value: "CZ" label: "Czech Republic" }
    allowed_value: { value: "DE" label: "Germany" }
    allowed_value: { value: "DK" label: "Denmark" }
    allowed_value: { value: "EG" label: "Egypt" }
    allowed_value: { value: "ES" label: "Spain" }
    allowed_value: { value: "FI" label: "Finland" }
    allowed_value: { value: "FR" label: "France" }
    allowed_value: { value: "GB" label: "United Kingdom" }
    allowed_value: { value: "HU" label: "Hungary" }
    allowed_value: { value: "ID" label: "Indonesia" }
    allowed_value: { value: "IL" label: "Israel" }
    allowed_value: { value: "IN" label: "India" }
    allowed_value: { value: "IT" label: "Italy" }
    allowed_value: { value: "JP" label: "Japan" }
    allowed_value: { value: "KR" label: "South Korea" }
    allowed_value: { value: "MX" label: "Mexico" }
    allowed_value: { value: "MY" label: "Malaysia" }
    allowed_value: { value: "NG" label: "Nigeria" }
    allowed_value: { value: "NL" label: "Netherlands" }
    allowed_value: { value: "NO" label: "Norway" }
    allowed_value: { value: "NZ" label: "New Zealand" }
    allowed_value: { value: "PH" label: "Philippines" }
    allowed_value: { value: "PL" label: "Poland" }
    allowed_value: { value: "PT" label: "Portugal" }
    allowed_value: { value: "RO" label: "Romania" }
    allowed_value: { value: "SA" label: "Saudi Arabia" }
    allowed_value: { value: "SE" label: "Sweden" }
    allowed_value: { value: "TH" label: "Thailand" }
    allowed_value: { value: "TR" label: "Turkey" }
    allowed_value: { value: "TW" label: "Taiwan" }
    allowed_value: { value: "UA" label: "Ukraine" }
    allowed_value: { value: "US" label: "United States" }
    allowed_value: { value: "VN" label: "Vietnam" }
    allowed_value: { value: "ZA" label: "South Africa" }
  }

  # --- Overridden Dimensions ---
  # The 'term' dimension is inherited from base_trends

  dimension: term {
    link: {
      label: "Term Analysis Dashboard"
      url: "/dashboards/google_trends::global_term_analysis?Refresh+Date=yesterday&Country={{ _filters['global_top_terms.dynamic_country'] | encode_uri }}&Term=%25{{ value }}%25&Region+Name={{ _filters['global_top_terms.region_name'] | encode_uri }}&Term+is={{ value }}&Similar=%25{{ value | encode_uri }}%25%2C%25{% assign words = value | split: ' ' %}{{ words[0] | encode_uri }}%25%2C%25{{ words | last | encode_uri }}%25"
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

  dimension: dma_id {
    group_label: "Helper Dimensions"
    label: "DMA ID (Raw US)"
    description: "Raw DMA ID (US only). Use 'Region Code' instead."
    sql: ${TABLE}.dma_id ;;
  }

  dimension: dma_name {
    group_label: "Helper Dimensions"
    label: "DMA Name (Raw US)"
    description: "Raw DMA Name (US only). Use 'Region Name' instead."
    type: string
    sql: ${TABLE}.dma_name ;;
  }

  dimension: region_code_1 {
    group_label: "Helper Dimensions"
    label: "Region Code (Raw Intl)"
    description: "Raw Region Code (International only). Use 'Region Code' instead."
    type: string
    sql: ${TABLE}.region_code ;;
  }

  dimension: region_name_1 {
    group_label: "Helper Dimensions"
    label: "Region Name (Raw Intl)"
    description: "Raw Region Name (International only). Use 'Region Name' instead."
    type: string
    sql: ${TABLE}.region_name ;;
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
    sql:
      {% if dynamic_country._parameter_value != 'US' %}${region_name_1}
      {% elsif dynamic_country._parameter_value  == 'US' %} ${dma_name}
      {% else %} ${region_name_1}
      {% endif %} ;;
  }

  dimension: region_code {
    group_label: "Geography"
    label: "Region Code"
    description: "The code of the sub-region. Shows DMA ID for the US and Region Code for other countries."
    type: string
    hidden: no
    sql:
      {% if dynamic_country._parameter_value != 'US' %}${region_code_1}
      {% elsif dynamic_country._parameter_value  == 'US' %} ${dma_id}
      {% else %} ${region_code_1}
      {% endif %} ;;
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
    available in the data (based on max_week)."
    hidden: no
    type: yesno
    sql: ${week_date} = DATE_TRUNC(${TABLE}.max_week, WEEK) ;;
  }

}
