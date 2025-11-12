view: base_trends {
  # This view is intended to be extended, not queried directly.
  # Fields are hidden by default and selectively exposed.
  fields_hidden_by_default: yes
  extension: required

  # --- Dimensions ---

  dimension: primary_key {
    label: "Primary Key"
    description: "A unique identifier generated for each row in the table."
    primary_key: yes
    type: string
    sql: ${TABLE}.primary_key ;;
    hidden: yes
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
      label: "Term Over time"
      url: "@{VIZ_CONFIG}{{ link }}&fields={{ _view._name }}.avg_score,{{ _view._name }}.week_week&fill_fields={{ _view._name }}.week_month&f[{{ _view._name }}.rank]=NOT+NULL&f[{{ _view._name }}.week_cat]=-NULL&f[global_top_terms.is_latest_week]=Yes%2CNo&sorts={{ _view._name }}.week_month+desc&limit=500&column_limit=50&vis_config={{ vis_config | encode_uri }}"
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
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.refresh_date ;;
  }

  dimension_group: week {
    group_label: "Dates"
    label: "Week "
    description: "The first day of the week for this data point in the time series."
    type: time
    timeframes: [date, raw, week, month, month_name, month_num, quarter, year, week_of_year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.week ;;
  }

  dimension: start_week {

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
