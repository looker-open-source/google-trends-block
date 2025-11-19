---
- dashboard: overview_global
  title: Overview Global
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: LZCLpDPrpdRFmiMfnFWTEv
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
      Country: global_top_terms.dynamic_country
      Region: global_top_terms.region_name
      Is Latest Week (Yes / No): global_top_terms.is_latest_week
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
      Week Cat: global_top_terms.week_cat
    row: 2
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
      Country: global_top_terms.dynamic_country
      Region: global_top_terms.region_name
      Is Latest Week (Yes / No): global_top_terms.is_latest_week
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
      Week Cat: global_top_terms.week_cat
    row: 2
    col: 15
    width: 9
    height: 15
  - title: New Tile
    name: New Tile
    model: google_trends
    explore: global_top_terms
    type: single_value
    fields: [global_top_terms.rank, global_top_terms.term, global_top_terms.avg_score]
    filters:
      global_top_terms.rank: '1'
    sorts: [global_top_terms.avg_score desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    smart_single_value_size: false
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
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [global_top_terms.rank, global_top_terms.avg_score]
    listen:
      Country: global_top_terms.dynamic_country
      Region: global_top_terms.region_name
      Is Latest Week (Yes / No): global_top_terms.is_latest_week
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
      Week Cat: global_top_terms.week_cat
    row: 0
    col: 0
    width: 5
    height: 2
  - title: 1st Trend Term Value
    name: 1st Trend Term Value
    model: google_trends
    explore: global_top_terms
    type: single_value
    fields: [global_top_terms.rank, global_top_terms.term, global_top_terms.avg_score]
    filters:
      global_top_terms.rank: '1'
    sorts: [global_top_terms.avg_score desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    custom_color: "#F9AB00"
    single_value_title: Avg. Score
    smart_single_value_size: false
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#1A73E8",
        font_color: "#f6fff8", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: ''
    orientation: auto
    style_global_top_terms.avg_score: "#FF8168"
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
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [global_top_terms.rank, global_top_terms.term]
    hidden_points_if_no: []
    series_labels: {}
    listen:
      Country: global_top_terms.dynamic_country
      Region: global_top_terms.region_name
      Is Latest Week (Yes / No): global_top_terms.is_latest_week
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
      Week Cat: global_top_terms.week_cat
    row: 0
    col: 5
    width: 3
    height: 2
  - title: 1st Trend Term Value (Copy)
    name: 1st Trend Term Value (Copy)
    model: google_trends
    explore: global_top_terms
    type: single_value
    fields: [global_top_terms.rank, global_top_terms.term, global_top_terms.avg_score]
    filters:
      global_top_terms.rank: '2'
    sorts: [global_top_terms.avg_score desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    custom_color: "#F9AB00"
    single_value_title: Avg. Score
    smart_single_value_size: false
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#EA4335",
        font_color: "#f6fff8", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: ''
    orientation: auto
    style_global_top_terms.avg_score: "#FF8168"
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
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [global_top_terms.rank, global_top_terms.term]
    hidden_points_if_no: []
    series_labels: {}
    listen:
      Country: global_top_terms.dynamic_country
      Region: global_top_terms.region_name
      Is Latest Week (Yes / No): global_top_terms.is_latest_week
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
      Week Cat: global_top_terms.week_cat
    row: 0
    col: 13
    width: 3
    height: 2
  - title: New Tile (Copy)
    name: New Tile (Copy)
    model: google_trends
    explore: global_top_terms
    type: single_value
    fields: [global_top_terms.rank, global_top_terms.term, global_top_terms.avg_score]
    filters:
      global_top_terms.rank: '2'
    sorts: [global_top_terms.avg_score desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    smart_single_value_size: false
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
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [global_top_terms.rank, global_top_terms.avg_score]
    listen:
      Country: global_top_terms.dynamic_country
      Region: global_top_terms.region_name
      Is Latest Week (Yes / No): global_top_terms.is_latest_week
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
      Week Cat: global_top_terms.week_cat
    row: 0
    col: 8
    width: 5
    height: 2
  - title: New Tile (Copy 2)
    name: New Tile (Copy 2)
    model: google_trends
    explore: global_top_terms
    type: single_value
    fields: [global_top_terms.rank, global_top_terms.term, global_top_terms.avg_score]
    filters:
      global_top_terms.rank: '3'
    sorts: [global_top_terms.avg_score desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    smart_single_value_size: false
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
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [global_top_terms.rank, global_top_terms.avg_score]
    listen:
      Country: global_top_terms.dynamic_country
      Region: global_top_terms.region_name
      Is Latest Week (Yes / No): global_top_terms.is_latest_week
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
      Week Cat: global_top_terms.week_cat
    row: 0
    col: 16
    width: 5
    height: 2
  - title: 1st Trend Term Value (Copy 2)
    name: 1st Trend Term Value (Copy 2)
    model: google_trends
    explore: global_top_terms
    type: single_value
    fields: [global_top_terms.rank, global_top_terms.term, global_top_terms.avg_score]
    filters:
      global_top_terms.rank: '3'
    sorts: [global_top_terms.avg_score desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    custom_color: "#F9AB00"
    single_value_title: Avg. Score
    smart_single_value_size: false
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#F9AB00",
        font_color: "#f6fff8", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: ''
    orientation: auto
    style_global_top_terms.avg_score: "#FF8168"
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
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [global_top_terms.rank, global_top_terms.term]
    hidden_points_if_no: []
    series_labels: {}
    listen:
      Country: global_top_terms.dynamic_country
      Region: global_top_terms.region_name
      Is Latest Week (Yes / No): global_top_terms.is_latest_week
      Is Latest Refresh Week (Yes / No): global_top_terms.is_latest_refresh_date
      Week Cat: global_top_terms.week_cat
    row: 0
    col: 21
    width: 3
    height: 2
  - title: Which terms are trending?
    name: Which terms are trending?
    model: google_trends
    explore: global_top_rising_terms
    type: looker_bar
    fields: [global_top_rising_terms.term, global_top_rising_terms.avg_score, global_top_rising_terms.average_percent_gain]
    sorts: [global_top_rising_terms.avg_score desc]
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: global_top_rising_terms.avg_score,
            id: global_top_rising_terms.avg_score, name: Average Score (Index)}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: bottom,
        series: [{axisId: global_top_rising_terms.average_percent_gain, id: global_top_rising_terms.average_percent_gain,
            name: Average % Growth}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [global_top_rising_terms.avg_score]
    hide_legend: false
    show_null_points: true
    interpolation: linear
    show_dropoff: false
    hidden_pivots: {}
    defaults_version: 1
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
    listen:
      Growth Tier: global_top_rising_terms.rising_tier
      Country: global_top_rising_terms.dynamic_country
      Region: global_top_rising_terms.region_name
      Is Latest Week (Yes / No): global_top_rising_terms.is_latest_week
      Is Latest Refresh Week (Yes / No): global_top_rising_terms.is_latest_refresh_date
      Week Cat: global_top_rising_terms.week_cat
    row: 19
    col: 0
    width: 16
    height: 13
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Trending Terms"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 17
    col: 0
    width: 24
    height: 2
  - title: Rising Term Distribution
    name: Rising Term Distribution
    model: google_trends
    explore: global_top_rising_terms
    type: looker_pie
    fields: [global_top_rising_terms.rising_tier, global_top_rising_terms.count_rising_terms]
    fill_fields: [global_top_rising_terms.rising_tier]
    filters:
      global_top_rising_terms.dynamic_country: US
      global_top_rising_terms.is_latest_refresh_date: 'Yes'
      global_top_rising_terms.is_latest_week: 'Yes'
    sorts: [global_top_rising_terms.count_rising_terms desc 0]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: global_top_rising_terms.avg_score,
            id: global_top_rising_terms.avg_score, name: Average Score (Index)}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: bottom,
        series: [{axisId: global_top_rising_terms.average_percent_gain, id: global_top_rising_terms.average_percent_gain,
            name: Average % Growth}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: pivot
    stacking: percent
    limit_displayed_rows: false
    hide_legend: true
    legend_position: right
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
    show_null_points: true
    interpolation: linear
    show_dropoff: false
    hidden_pivots: {}
    defaults_version: 1
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
    listen:
      Country: global_top_rising_terms.dynamic_country
      Region: global_top_rising_terms.region_name
      Is Latest Week (Yes / No): global_top_rising_terms.is_latest_week
      Is Latest Refresh Week (Yes / No): global_top_rising_terms.is_latest_refresh_date
      Week Cat: global_top_rising_terms.week_cat
    row: 19
    col: 16
    width: 8
    height: 13
  - title: Top and Rising Terms
    name: Top and Rising Terms
    model: google_trends
    explore: global_top_rising_terms
    type: looker_grid
    fields: [global_top_terms.term, global_top_rising_terms.avg_score, global_top_rising_terms.average_percent_gain,
      global_top_rising_terms.avg_rank]
    sorts: [global_top_rising_terms.avg_score desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: true
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      global_top_terms.term: Term
      global_top_rising_terms.avg_score: Score
      global_top_rising_terms.average_percent_gain: "% Growth"
      global_top_rising_terms.avg_rank: Rank
    series_cell_visualizations:
      global_top_rising_terms.avg_score:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: [global_top_rising_terms.avg_score]},
      {type: along a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [global_top_rising_terms.average_percent_gain]}]
    series_value_format:
      global_top_rising_terms.avg_score:
        format_string: "#,##0"
      global_top_rising_terms.average_percent_gain:
        format_string: "#,##0"
      global_top_rising_terms.avg_rank:
        format_string: "#,##0"
    hidden_pivots: {}
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Top and Rising terms (Growth Tier Filter)
    listen:
      Growth Tier: global_top_rising_terms.rising_tier
      Country: global_top_terms.dynamic_country
      Region: global_top_terms.region_name
      Is Latest Week (Yes / No): global_top_rising_terms.is_latest_week
      Is Latest Refresh Week (Yes / No): global_top_rising_terms.is_latest_refresh_date
      Week Cat: global_top_terms.week_cat
    row: 32
    col: 0
    width: 24
    height: 4
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
    default_value: US
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
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
    listens_to_filters: [Country]
    field: global_top_terms.region_name
  - name: Growth Tier
    title: Growth Tier
    type: field_filter
    default_value: '"Breakout (> 5,000%)","Soaring (1,000% - 5,000%)"'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: google_trends
    explore: global_top_rising_terms
    listens_to_filters: []
    field: global_top_rising_terms.rising_tier
