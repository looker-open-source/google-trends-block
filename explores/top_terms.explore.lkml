include: "/views/refined/**.view.lkml"

explore: global_top_rising_terms {
  label: "Top and Rising Terms"
  join:  global_top_terms{
    type: inner
    relationship: many_to_one
    sql_on: ${global_top_terms.term} = ${global_top_rising_terms.term} AND
            ${global_top_terms.week_week} = ${global_top_rising_terms.week_week} AND
            --${global_top_terms.refresh_week} = ${global_top_rising_terms.refresh_week} AND
            ${global_top_terms.country_name} = ${global_top_rising_terms.country_name} AND
            ${global_top_terms.region_name} = ${global_top_rising_terms.region_name};;
  }
  persist_with: google_trends
}

# explore: top_and_rising_terms {}
