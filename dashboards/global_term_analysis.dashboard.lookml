---
- dashboard: global_term_analysis
  title: Term Analysis Global
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: IaafMnQDDxKk6YpCFNqoeK
  elements:
  - title: Comparison vs Other Regions
    name: Comparison vs Other Regions
    model: google_trends
    explore: global_top_terms
    type: looker_grid
    fields: [global_top_terms.region_name, global_top_terms.percent_difference_vs_reference,
      global_top_terms.avg_score]
    filters:
      global_top_terms.is_latest_week: 'Yes'
      global_top_terms.avg_score: NOT NULL
      global_top_terms.percent_difference_vs_reference: NOT NULL
      global_top_terms.dynamic_region: ''
    sorts: [global_top_terms.percent_difference_vs_reference desc]
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
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
        reverse: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels: {}
    series_cell_visualizations:
      global_top_terms.avg_score:
        is_active: false
        palette:
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      global_top_terms.percent_difference_vs_reference:
        is_active: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: cdddc9eb-73cc-6c5c-8459-02741a8919da, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#e6bed6", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [global_top_terms.avg_score]}]
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
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    series_colors:
      global_top_terms.avg_score: "#079c98"
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
    note_state: collapsed
    note_display: hover
    note_text: This table compares the Relative Level of Interest for a specific search
      term across regions against a reference region selected on Filters Section.
    listen:
      Country: global_top_terms.dynamic_country
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
      Week: global_top_terms.week_cat
      Term is: global_top_terms.term
      Is Latest Week (Yes / No): global_top_terms.is_latest_week
      Region Name: global_top_terms.dynamic_region
    row: 7
    col: 0
    width: 12
    height: 10
  - title: Similar terms (Top terms table)
    name: Similar terms (Top terms table)
    model: google_trends
    explore: global_top_terms
    type: looker_area
    fields: [global_top_terms.avg_score, global_top_terms.term, global_top_terms.week_week]
    pivots: [global_top_terms.term]
    filters:
      global_top_terms.avg_score: "<100"
    sorts: [global_top_terms.term, global_top_terms.week_week desc]
    limit: 500
    column_limit: 5
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
    show_null_points: false
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      global_top_terms.avg_score: "#7CB342"
    ordering: none
    show_null_labels: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Country: global_top_terms.dynamic_country
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
      Similar: global_top_terms.term
      Region Name: global_top_terms.region_name
    row: 0
    col: 0
    width: 24
    height: 7
  - title: Term Over Time (Last 20 weeks)
    name: Term Over Time (Last 20 weeks)
    model: google_trends
    explore: global_top_terms
    type: looker_area
    fields: [global_top_terms.avg_score, global_top_terms.week_week, global_top_terms.avg_rank]
    filters:
      global_top_terms.date_week: 20 weeks
    sorts: [global_top_terms.week_week desc]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [global_top_terms.avg_rank]
    series_colors:
      global_top_terms.avg_score: "#7CB342"
    series_point_styles:
      global_top_terms.avg_rank: auto
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    ordering: none
    show_null_labels: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
      Country: global_top_terms.dynamic_country
      Term is: global_top_terms.term
      Region Name: global_top_terms.region_name
    row: 7
    col: 12
    width: 12
    height: 10
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
  - name: Week
    title: Week
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
    default_value: US
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
      type: dropdown_menu
      display: inline
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
