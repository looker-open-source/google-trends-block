---
- dashboard: global_term_analysis
  title: Term Analysis Global
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: It3RizN2CMzmZ4YkIxZw5Y
  elements:
  - title: By Region
    name: By Region
    model: google_trends
    explore: global_top_terms
    type: looker_grid
    fields: [global_top_terms.avg_score, global_top_terms.region_name]
    filters:
      global_top_terms.is_latest_week: 'Yes'
    sorts: [global_top_terms.avg_score desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: circle
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
        reverse: true
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: true
    series_colors:
      global_top_terms.avg_score: "#079c98"
    series_labels: {}
    column_spacing_ratio: 0
    show_dropoff: false
    rotation: true
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    hidden_points_if_no: []
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Is Latest Week (Yes / No): global_top_terms.is_latest_week
      Week Cat: global_top_terms.week_cat
      Country: global_top_terms.dynamic_country
      Similar: global_top_terms.term
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
    row: 7
    col: 0
    width: 24
    height: 10
  - title: Similar terms (Top terms table)
    name: Similar terms (Top terms table)
    model: google_trends
    explore: global_top_terms
    type: looker_column
    fields: [global_top_terms.avg_score, global_top_terms.term, global_top_terms.week_week]
    pivots: [global_top_terms.term]
    filters:
      global_top_terms.avg_score: "<100"
    sorts: [global_top_terms.term, global_top_terms.week_week desc]
    limit: 500
    column_limit: 7
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: monotone
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      global_top_terms.avg_score: "#7CB342"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Country: global_top_terms.dynamic_country
      Similar: global_top_terms.term
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
    row: 0
    col: 0
    width: 24
    height: 7
  filters:
  - name: Is Latest Refresh Week (Yes / No)
    title: Is Latest Refresh Week (Yes / No)
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
      options:
      - 'Yes'
    model: google_trends
    explore: global_top_terms
    listens_to_filters: []
    field: global_top_terms.is_latest_refresh_date
  - name: Is Latest Week (Yes / No)
    title: Is Latest Week (Yes / No)
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: google_trends
    explore: global_top_terms
    listens_to_filters: []
    field: global_top_terms.is_latest_week
  - name: Week Cat
    title: Week Cat
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: google_trends
    explore: global_top_terms
    listens_to_filters: [Is Latest Week (Yes / No)]
    field: global_top_terms.week_cat
  - name: Country
    title: Country
    type: field_filter
    default_value: MX
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: google_trends
    explore: global_top_terms
    listens_to_filters: []
    field: global_top_terms.dynamic_country
  - name: Region Name
    title: Region Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: google_trends
    explore: global_top_terms
    listens_to_filters: [Country]
    field: global_top_terms.region_name
  - name: Term is
    title: Term is
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: google_trends
    explore: global_top_terms
    listens_to_filters: []
    field: global_top_terms.term
  - name: Similar
    title: Similar
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: google_trends
    explore: global_top_terms
    listens_to_filters: []
    field: global_top_terms.term
