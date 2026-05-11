connection: "@{CONNECTION_NAME}"


include: "/explores/*.explore.lkml"
include: "/dashboards/*.dashboard"
include: "/views/refined/*.view.lkml"

datagroup: google_trends {
  max_cache_age: "12 hour"
  sql_trigger: SELECT MAX(refresh_date) FROM  `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.international_top_terms` ;;
}

persist_with: google_trends
