include: "../raw/**.view.lkml"

view: +international_top_rising_terms {
  derived_table: {
    sql: SELECT
          *,
          GENERATE_UUID() as primary_key
        FROM `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.international_top_rising_terms` ;;
  }

  dimension: primary_key {
    hidden: yes
    type: string
    sql: ${TABLE}.primary_key ;;
    primary_key: yes
  }

  dimension: term {
    drill_fields: []
    link: {
      label: "Term Over time"
      url: "@{VIZ_CONFIG}{{ link }}&fields=global_top_terms.avg_score,global_top_terms.week_month&fill_fields=global_top_terms.week_month&sorts=global_top_terms.week_month+desc&limit=500&column_limit=50&vis_config={{ vis_config | encode_uri }}"
    }
    link: {
      label: "Term By Region"
      url: "@{VIZ_CONFIG}{{ link }}&fields=global_top_terms.avg_score,global_top_terms.region_name&sorts=global_top_terms.avg_score+desc+0&limit=500&column_limit=50&vis_config={{ vis_config | encode_uri }}"
    }
  }

  measure: avg_score {
    label: "Average Score  (Index)"
    type: average
    sql: ${score} ;;
    value_format_name: decimal_0
  }

  measure: avg_rank {
    label: "Average Rank"
    type: average
    sql: ${rank} ;;
    value_format_name: decimal_0
  }

  measure: inverted_rank {
    type: number
    sql: 25 - ${rank} + 1 ;;
    hidden: yes
  }

  measure: normalized_weight {
    type: percent_of_total
    sql: ${inverted_rank} ;;
    label: "Proportional weight (Word Cloud)"
    value_format_name: percent_0
  }

  measure: percent_gain_avg {
    type: average
    sql: ${percent_gain} ;;
  }
}