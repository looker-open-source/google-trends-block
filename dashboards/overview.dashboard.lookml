---
- dashboard: overview
  title: Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: NhTMq5nSmRBqc1N7Hv17Ya
  elements:
  - title: Top Terms
    name: Top Terms
    model: google_trends
    explore: international_top_terms
    type: looker_bar
    fields: [international_top_terms.rank, international_top_terms.term, international_top_terms.avg_score]
    filters:
      international_top_terms.country_name: Mexico
      international_top_terms.region_name: Mexico City
      international_top_terms.refresh_date: last day
    sorts: [international_top_terms.rank]
    limit: 25
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    column_spacing_ratio: 0.2
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [international_top_terms.rank]
    listen:
      Country: international_top_terms.country_name
      Region: international_top_terms.region_name
      Refresh Date: international_top_terms.refresh_date
    row: 0
    col: 0
    width: 15
    height: 15
  filters:
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: google_trends
    explore: international_top_terms
    listens_to_filters: [Region]
    field: international_top_terms.country_name
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: google_trends
    explore: international_top_terms
    listens_to_filters: [Country]
    field: international_top_terms.region_name
  - name: Refresh Date
    title: Refresh Date
    type: field_filter
    default_value: 2025/08/26 to 2025/08/27
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: google_trends
    explore: international_top_terms
    listens_to_filters: []
    field: international_top_terms.refresh_date
