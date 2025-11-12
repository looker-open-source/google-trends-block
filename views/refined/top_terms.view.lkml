include: "../raw/**.view.lkml"
include: "./base_trends.view.lkml"

view: +top_terms {
  extends: [base_trends]
  derived_table: {
    sql: SELECT
          *,
          GENERATE_UUID() as primary_key
        FROM `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.top_terms` ;;
  }

  dimension: percent_gain {
    description: ""
    label: ""
    hidden: no
  }
}
