include: "../raw/**.view.lkml"

view: +top_rising_terms {
  derived_table: {
    sql: SELECT
          *,
          GENERATE_UUID() as primary_key
        FROM `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.top_rising_terms` ;;
  }
}
