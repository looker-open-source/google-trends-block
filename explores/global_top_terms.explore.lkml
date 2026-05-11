include: "/views/refined/global_top_terms.view"


explore: global_top_terms {
  persist_with: google_trends
  # sql_always_where: ${refresh_date} = ${max_refresh_date} ;;
}
