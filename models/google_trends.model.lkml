connection: "@{CONNECTION_NAME}"

# include all the explores & Dashboards
#
# include: "/explores/*.explore.lkml"
include: "/dashboards/*.dashboard"
include: "/views/refined/*.view.lkml"

datagroup: google_trends {
  max_cache_age: "24 hour"
}

persist_with: google_trends

explore: top_terms {}
explore: international_top_terms {
  persist_for: "24 hours"
}

explore: international_top_rising_terms {
  persist_for: "24 hours"
}
