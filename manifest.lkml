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

constant: VIZ_CONFIG {
  value:"{% assign vis_config = '{
  \"x_axis_gridlines\": false,
  \"y_axis_gridlines\": true,
  \"show_view_names\": false,
  \"show_y_axis_labels\": true,
  \"show_y_axis_ticks\": true,
  \"y_axis_tick_density\": \"default\",
  \"y_axis_tick_density_custom\": 5,
  \"show_x_axis_label\": true,
  \"show_x_axis_ticks\": true,
  \"y_axis_scale_mode\": \"linear\",
  \"x_axis_reversed\": false,
  \"y_axis_reversed\": false,
  \"plot_size_by_field\": false,
  \"trellis\": \"\",
  \"stacking\": \"\",
  \"limit_displayed_rows\": false,
  \"legend_position\": \"center\",
  \"point_style\": \"none\",
  \"show_value_labels\": false,
  \"label_density\": 25,
  \"x_axis_scale\": \"auto\",
  \"y_axis_combined\": true,
  \"show_null_points\": true,
  \"interpolation\": \"monotone\",
  \"show_totals_labels\": false,
  \"show_silhouette\": false,
  \"totals_color\": \"#808080\",
  \"x_axis_zoom\": true,
  \"y_axis_zoom\": true,
  \"series_types\": {},
  \"series_colors\": {
  \"international_top_terms.avg_score\": \"#7CB342\"
  },
  \"type\": \"looker_area\",
  \"defaults_version\": 1,
  \"show_null_labels\": true}' %}"
}


constant: VIZ_REGION {
  value: "{% assign vis_config = '{
    \"x_axis_gridlines\": false,
    \"y_axis_gridlines\": true,
    \"show_view_names\": false,
    \"show_y_axis_labels\": true,
    \"show_y_axis_ticks\": true,
    \"y_axis_tick_density\": \"default\",
    \"y_axis_tick_density_custom\": 5,
    \"show_x_axis_label\": true,
    \"show_x_axis_ticks\": true,
    \"y_axis_scale_mode\": \"linear\",
    \"x_axis_reversed\": false,
    \"y_axis_reversed\": false,
    \"plot_size_by_field\": false,
    \"trellis\": \"\",
    \"stacking\": \"\",
    \"limit_displayed_rows\": false,
    \"legend_position\": \"center\",
    \"point_style\": \"circle\",
    \"show_value_labels\": true,
    \"label_density\": 25,
    \"x_axis_scale\": \"auto\",
    \"y_axis_combined\": true,
    \"ordering\": \"none\",
    \"show_null_labels\": false,
    \"show_totals_labels\": false,
    \"show_silhouette\": false,
    \"totals_color\": \"#808080\",
    \"color_application\": {
        \"collection_id\": \"7c56cc21-66e4-41c9-81ce-a60e1c3967b2\",
        \"palette_id\": \"5d189dfc-4f46-46f3-822b-bfb0b61777b1\",
        \"options\": {
            \"steps\": 5,
            \"__FILE\": \"google_trends/dashboards/overview.dashboard.lookml\",
            \"__LINE_NUM\": 53,
            \"reverse\": true
        }
    },
    \"x_axis_label\": \"\",
    \"x_axis_zoom\": true,
    \"y_axis_zoom\": true,
    \"limit_displayed_rows_values\": {
        \"show_hide\": \"hide\",
        \"first_last\": \"first\",
        \"num_rows\": 0
    },
    \"hide_legend\": true,
    \"series_types\": {},
    \"series_colors\": {
        \"international_top_terms.avg_score\": \"#079c98\"
    },
    \"series_labels\": {},
    \"column_spacing_ratio\": 0,
    \"show_dropoff\": false,
    \"rotation\": true,
    \"type\": \"looker_column\",
    \"show_row_numbers\": true,
    \"transpose\": false,
    \"truncate_text\": true,
    \"hide_totals\": false,
    \"hide_row_totals\": false,
    \"size_to_fit\": true,
    \"table_theme\": \"white\",
    \"enable_conditional_formatting\": false,
    \"header_text_alignment\": \"left\",
    \"header_font_size\": 12,
    \"rows_font_size\": 12,
    \"conditional_formatting_include_totals\": false,
    \"conditional_formatting_include_nulls\": false,
    \"defaults_version\": 1,
    \"hidden_pivots\": {},
    \"hidden_fields\": [],
    \"hidden_points_if_no\": [],
    \"show_null_points\": true,
    \"interpolation\": \"linear\",
    \"value_labels\": \"legend\",
    \"label_type\": \"labPer\",
    \"custom_color_enabled\": true,
    \"show_single_value_title\": true,
    \"show_comparison\": false,
    \"comparison_type\": \"value\",
    \"comparison_reverse_colors\": false,
    \"show_comparison_label\": true
}' %}"
}
