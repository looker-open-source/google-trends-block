include: "../raw/**.view.lkml"

view: +top_terms {
  derived_table: {
    sql: SELECT
          *,
          GENERATE_UUID() as primary_key
        FROM `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.top_terms` ;;
  }
}
