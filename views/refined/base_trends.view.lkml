view: base_trends {
  # This view is intended to be extended, not queried directly.
  # Fields are hidden by default and selectively exposed.
  fields_hidden_by_default: yes
  extension: required

  # --- Parameters ---

  parameter: dynamic_country {
    group_label: "Filters"
    label: "Country"
    description: "Filter data by a specific country code (e.g., 'US', 'GB', 'MX'). Default is 'US'."
    type: unquoted
    hidden: no
    default_value: "US"

    allowed_value: { value: "AR" label: "Argentina" }
    allowed_value: { value: "AU" label: "Australia" }
    allowed_value: { value: "AT" label: "Austria" }
    allowed_value: { value: "BE" label: "Belgium" }
    allowed_value: { value: "BR" label: "Brazil" }
    allowed_value: { value: "CA" label: "Canada" }
    allowed_value: { value: "CL" label: "Chile" }
    allowed_value: { value: "CO" label: "Colombia" }
    allowed_value: { value: "CZ" label: "Czech Republic" }
    allowed_value: { value: "DK" label: "Denmark" }
    allowed_value: { value: "EG" label: "Egypt" }
    allowed_value: { value: "FI" label: "Finland" }
    allowed_value: { value: "FR" label: "France" }
    allowed_value: { value: "DE" label: "Germany" }
    allowed_value: { value: "HU" label: "Hungary" }
    allowed_value: { value: "ID" label: "Indonesia" }
    allowed_value: { value: "IN" label: "India" }
    allowed_value: { value: "IL" label: "Israel" }
    allowed_value: { value: "IT" label: "Italy" }
    allowed_value: { value: "JP" label: "Japan" }
    allowed_value: { value: "MY" label: "Malaysia" }
    allowed_value: { value: "MX" label: "Mexico" }
    allowed_value: { value: "NL" label: "Netherlands" }
    allowed_value: { value: "NZ" label: "New Zealand" }
    allowed_value: { value: "NG" label: "Nigeria" }
    allowed_value: { value: "NO" label: "Norway" }
    allowed_value: { value: "PH" label: "Philippines" }
    allowed_value: { value: "PL" label: "Poland" }
    allowed_value: { value: "PT" label: "Portugal" }
    allowed_value: { value: "RO" label: "Romania" }
    allowed_value: { value: "ZA" label: "South Africa" }
    allowed_value: { value: "SA" label: "Saudi Arabia" }
    allowed_value: { value: "KR" label: "South Korea" }
    allowed_value: { value: "ES" label: "Spain" }
    allowed_value: { value: "SE" label: "Sweden" }
    allowed_value: { value: "CH" label: "Switzerland" }
    allowed_value: { value: "TW" label: "Taiwan" }
    allowed_value: { value: "TH" label: "Thailand" }
    allowed_value: { value: "TR" label: "Turkey" }
    allowed_value: { value: "UA" label: "Ukraine" }
    allowed_value: { value: "GB" label: "United Kingdom" }
    allowed_value: { value: "US" label: "United States" }
    allowed_value: { value: "VN" label: "Vietnam" }
  }

  # --- Dimensions ---

  dimension: primary_key {
    label: "Primary Key"
    description: "A unique identifier generated for each row in the table."
    primary_key: yes
    type: string
    sql: ${TABLE}.primary_key ;;
    hidden: yes
  }

    # --- Group: Geography ---

  dimension: country_code {
    group_label: "Geography"
    label: "Country Code"
    description: "Two-letter ISO code for the country (e.g., 'US', 'GB')."
    type: string
    sql: ${TABLE}.country_code ;;
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
    sql: ${TABLE}.region_code ;;
  }
  # --- Group: Trend Details ---

  dimension: term {
    group_label: "Trend Details"
    label: "Search Term"
    description: "The human-readable identifier for a search term (e.g., 'Acme Inc')."
    type: string
    sql: ${TABLE}.term ;;
    hidden: no
    drill_fields: []
    link: {
      label: "Term Over time (last year)"
      url: "@{VIZ_CONFIG}{{ link }}&fields={{ _view._name }}.avg_score,{{ _view._name }}.week_week&fill_fields={{ _view._name }}.week_week&f[{{ _view._name }}.rank]=NOT+NULL&f[{{ _view._name }}.week_cat]=-NULL&f[{{ _view._name }}.is_latest_week]=Yes%2CNo&f[{{ _view._name }}.week_year]=1+years&sorts={{ _view._name }}.week_month+desc&limit=500&column_limit=50&vis_config={{ vis_config | encode_uri }}"
    }
    link: {
      label: "Term By Region"
      url: "@{VIZ_REGION}{{ link }}&fields={{ _view._name }}.avg_score,{{ _view._name }}.region_name&sorts={{ _view._name }}.avg_score+desc+0&limit=60&column_limit=15&vis_config={{ vis_config | encode_uri }}"
    }
  }

  dimension: rank {
    group_label: "Trend Details"
    label: "Rank"
    description: "Numeric rank (1-25) of the term compared to other top terms for the day across the US market."
    type: number
    sql: ${TABLE}.rank ;;
    hidden: no
  }

  dimension: score {
    group_label: "Trend Details"
    label: "Score (0-100)"
    description: "Index (0-100) indicating the term's popularity for region, relative to its own 5-year history."
    type: number
    sql: ${TABLE}.score ;;
    hidden: no
  }

  # --- Group: Dates ---

  dimension_group: refresh {
    group_label: "Dates"
    label: "Refresh "
    description: "The date when this set of term, score, and DMA data was added. This is the partition key."
    type: time
    timeframes: [raw, date, week]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.refresh_date ;;
    can_filter: no
  }

  dimension_group: week {
    group_label: "Dates"
    label: "Week "
    description: "The first day of the week for this data point in the time series."
    type: time
    timeframes: [date, raw, week]
    convert_tz: no
    datatype: date
    # hidden: no
    sql: ${TABLE}.week ;;
    # can_filter: no
  }

  dimension: date_week {
    group_label: "Dates"
    label: "Date Week"
    type: date_week
    sql: TIMESTAMP(${TABLE}.week) ;;
    hidden: no
  }

  dimension: week_cat {
    group_label: "Dates"
    description: "Categorical Date Week, it takes the week_date value as string not as date dimension_group"
    hidden: no
    type: string
    sql: CAST(${TABLE}.week AS STRING) ;;
  }

  dimension: refresh_date_cat {
    group_label: "Dates"
    description: "Categorical Refresh Week, it takes the refresh_date value as string not as date dimension_group"
    label: "Refresh Date"
    hidden: no
    type: string
    sql: CAST(${TABLE}.refresh_date AS STRING) ;;
  }

  # --- Measures ---

  measure: avg_score {
    group_label: "Metrics"
    label: "Average Score (Index)"
    description: "The average of the 0-100 popularity score across the selected time and dimensions."
    type: average
    sql: ${score} ;;
    value_format_name: decimal_0
    hidden: no
  }

  measure: avg_rank {
    group_label: "Metrics"
    label: "Average Rank"
    description: "The average rank (1-25) across the selected time and dimensions."
    type: average
    sql: ${rank} ;;
    value_format_name: decimal_0
    hidden: no
  }

  measure: inverted_rank {
    group_label: "Metrics"
    label: "Inverted Rank (for Word Cloud)"
    description: "A calculated field (25 - Rank + 1) used for weighting. A #1 rank becomes 25."
    type: number
    sql: 25 - ${rank} + 1 ;;
    hidden: yes
  }

  measure: normalized_weight {
    group_label: "Metrics"
    label: "Proportional Weight (Word Cloud)"
    description: "The term's 'Inverted Rank' as a percentage of the total. Useful for word cloud visualizations."
    type: percent_of_total
    sql: ${inverted_rank} ;;
    value_format_name: percent_0
    hidden: no
  }
}
