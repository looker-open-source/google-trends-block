include: "../raw/**.view.lkml"

view: +international_top_terms {
  derived_table: {
    sql: SELECT
          *,
          GENERATE_UUID() as primary_key
        FROM `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.international_top_terms` ;;
  }

  dimension: primary_key {
    hidden: yes
    type: string
    sql: ${TABLE}.primary_key ;;
    primary_key: yes
  }

  dimension: term {
    drill_fields: [term]
    link: {
      label: "Term Over time"
      url: "/explore/google_trends/international_top_terms?fields=international_top_terms.avg_score,international_top_terms.week_month&fill_fields=international_top_terms.week_month&f[international_top_terms.country_name]={{ international_top_terms.country_name | url_encode }}&f[international_top_terms.region_name]={{ international_top_terms.region_name | url_encode }}&f[international_top_terms.term]={{ value | url_encode }}&sorts=international_top_terms.week_month+desc&limit=500&column_limit=50"
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
}
