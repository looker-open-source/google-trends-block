connection: "@{CONNECTION_NAME}"

# include all the explores & Dashboards
#
# include: "/explores/*.explore.lkml"
# include: "/dashboards/*.dashboard"

datagroup: google_trends {
  max_cache_age: "24 hour"
}

persist_with: google_trends
