---
- dashboard: overview_global
  title: Overview Global
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: QqTdsE1asE4DkGy0gqtTQP
  elements:
  - title: Top Terms
    name: Top Terms
    model: google_trends
    explore: global_top_terms
    type: looker_bar
    fields: [global_top_terms.rank, global_top_terms.term, global_top_terms.avg_score]
    sorts: [global_top_terms.rank]
    limit: 500
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
    hidden_fields: [global_top_terms.rank]
    listen:
      Region: global_top_terms.region_name
      Dynamic Country: global_top_terms.dynamic_country
    row: 0
    col: 0
    width: 15
    height: 15
  - title: Ranking
    name: Ranking
    model: google_trends
    explore: global_top_terms
    type: looker_wordcloud
    fields: [global_top_terms.term, global_top_terms.rank, global_top_terms.avg_rank]
    sorts: [global_top_terms.avg_rank desc 0]
    limit: 15
    column_limit: 50
    dynamic_fields:
    - _kind_hint: dimension
      _type_hint: number
      args:
      - global_top_terms.rank
      based_on: global_top_terms.rank
      calculation_type: percent_of_column_sum
      category: table_calculation
      label: Percent of International Top Terms Rank
      source_field: global_top_terms.rank
      table_calculation: percent_of_global_top_terms_rank
      value_format:
      value_format_name: percent_0
      is_disabled: true
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
        reverse: true
    rotation: true
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
    hidden_fields: [global_top_terms.rank, global_top_terms.term_first, global_top_terms.term_last]
    listen:
      Region: global_top_terms.region_name
      Dynamic Country: global_top_terms.dynamic_country
    row: 0
    col: 15
    width: 9
    height: 15
  filters:
  - name: Dynamic Country
    title: Dynamic Country
    type: field_filter
    default_value: US
    allow_multiple_values: true
    required: true
    ui_config:
      type: tag_list
      display: popover
    model: google_trends
    explore: global_top_terms
    listens_to_filters: []
    field: global_top_terms.dynamic_country
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
    explore: global_top_terms
    listens_to_filters: [Dynamic Country]
    field: global_top_terms.region_name
