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
  \"global_top_terms.avg_score\": \"#7CB342\"
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
    \"point_style\": \"none\",
    \"show_value_labels\": false,
    \"label_density\": 25,
    \"x_axis_scale\": \"auto\",
    \"y_axis_combined\": true,
    \"ordering\": \"none\",
    \"show_null_labels\": true,
    \"show_totals_labels\": false,
    \"show_silhouette\": false,
    \"totals_color\": \"#808080\",
    \"x_axis_zoom\": true,
    \"y_axis_zoom\": true,
    \"series_types\": {},
    \"series_colors\": {
        \"global_top_terms.avg_score\": \"#12B5CB\"
    },
    \"show_null_points\": true,
    \"interpolation\": \"monotone\",
    \"type\": \"looker_bar\",
    \"defaults_version\": 1,
    \"map\": \"auto\",
    \"map_projection\": \"\",
    \"quantize_colors\": false,
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
    \"conditional_formatting_include_nulls\": false
}' %}"
}

constant: VIZ_TERM_TRENDING {
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
    \"show_null_points\": true,
    \"interpolation\": \"linear\",
    \"x_axis_zoom\": true,
    \"y_axis_zoom\": true,
    \"hide_legend\": false,
    \"series_types\": {},
    \"series_colors\": {
        \"global_top_rising_terms.average_percent_gain\": \"#E8710A\"
    },
    \"swap_axes\": false,
    \"type\": \"looker_line\",
    \"ordering\": \"none\",
    \"show_null_labels\": true,
    \"show_totals_labels\": false,
    \"show_silhouette\": false,
    \"totals_color\": \"#808080\",
    \"defaults_version\": 1,
    \"hidden_fields\": [],
    \"hidden_pivots\": {}
}' %}"
}
