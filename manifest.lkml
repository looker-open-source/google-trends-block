project_name: "google_trends"

constant: CONNECTION_NAME {
  value: "default_bigquery_connection"
  export: override_required
}

constant: TRENDS_DATASET {
  value: "google_trends"
  export: override_optional
}

constant: TRENDS_PUBLIC_PROJECT_ID {
  value: "bigquery-public-data"
  export: override_optional
}
