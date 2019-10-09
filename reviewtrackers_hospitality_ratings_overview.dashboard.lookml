- dashboard: reviewtrackers_hospitality_rating_overview
  title: ReviewTrackers Hospitality Rating Overview
  layout: newspaper
  elements:
  - title: Reviews
    name: Reviews
    model: reviewtrackers_hospitality
    explore: review
    type: single_value
    fields: [review.count]
    limit: 500
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 6
    col: 0
    width: 4
    height: 2
  - title: Average Rating KPI
    name: Average Rating KPI
    model: reviewtrackers_hospitality
    explore: review
    type: single_value
    fields: [review.rating_stars]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 0
    col: 0
    width: 4
    height: 2
  - title: Average Rating Overall
    name: Average Rating Overall
    model: reviewtrackers_hospitality
    explore: review
    type: single_value
    fields: [review.rating_value, review.old_rating]
    limit: 500
    dynamic_fields: [{table_calculation: change, label: Change, expression: "(${review.rating_value}-${review.old_rating})/${review.old_rating}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [review.old_rating]
    series_types: {}
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 2
    col: 0
    width: 4
    height: 4
  - title: Reviews by Rating
    name: Reviews by Rating
    model: reviewtrackers_hospitality
    explore: review
    type: looker_column
    fields: [review.count, review.rating_dimension]
    pivots: [review.rating_dimension]
    sorts: [review.rating_dimension]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: legacy_diverging1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: review.count, id: 1
              - review.count, name: '1'}, {axisId: review.count, id: 2 - review.count,
            name: '2'}, {axisId: review.count, id: 3 - review.count, name: '3'}, {
            axisId: review.count, id: 4 - review.count, name: '4'}, {axisId: review.count,
            id: 5 - review.count, name: '5'}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 0
    col: 4
    width: 8
    height: 6
  - title: Reviews & Average Sentiment Last 12 Weeks
    name: Reviews & Average Sentiment Last 12 Weeks
    model: reviewtrackers_hospitality
    explore: review
    type: looker_line
    fields: [review.review_published_week, review.sentiment_value, review.count]
    fill_fields: [review.review_published_week]
    filters:
      review.review_published_week: 12 weeks
    sorts: [review.review_published_week desc]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: review.sentiment_value,
            id: review.sentiment_value, name: Review Sentiment Value}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{axisId: review.count, id: review.count,
            name: Reviews}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hide_legend: true
    legend_position: center
    series_types:
      review.count: area
    point_style: none
    series_colors:
      review.count: "#1ea8df"
      review.sentiment_value: "#353b49"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen:
      Location: location.location
      Source: review.source
    row: 0
    col: 12
    width: 12
    height: 6
  - title: Reviews by Rating Last 12 Weeks
    name: Reviews by Rating Last 12 Weeks
    model: reviewtrackers_hospitality
    explore: review
    type: looker_column
    fields: [review.count, review.rating_dimension, review.review_published_week]
    pivots: [review.rating_dimension]
    fill_fields: [review.review_published_week]
    filters:
      review.review_published_week: 12 weeks
    sorts: [review.rating_dimension, review.review_published_week desc]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: legacy_diverging1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: review.count, id: 1
              - review.count, name: '1'}, {axisId: review.count, id: 2 - review.count,
            name: '2'}, {axisId: review.count, id: 3 - review.count, name: '3'}, {
            axisId: review.count, id: 4 - review.count, name: '4'}, {axisId: review.count,
            id: 5 - review.count, name: '5'}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Location: location.location
      Source: review.source
    row: 6
    col: 12
    width: 12
    height: 6
  - title: Locations Ratings
    name: Locations Ratings
    model: reviewtrackers_hospitality
    explore: review
    type: looker_map
    fields: [location.location_gps, review.rating_value, location.location]
    sorts: [review.rating_value desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: restaurant
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    map_value_scale_clamp_min: 1
    map_value_scale_clamp_max: 5
    series_types: {}
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 6
    col: 4
    width: 8
    height: 6
  - title: Number of Locations
    name: Number of Locations
    model: reviewtrackers_hospitality
    explore: review
    type: single_value
    fields: [location.count]
    limit: 500
    listen:
      Location: location.location
      Source: review.source
    row: 10
    col: 0
    width: 4
    height: 2
  - title: Reviews w/ Response
    name: Reviews w/ Response
    model: reviewtrackers_hospitality
    explore: review
    type: single_value
    fields: [review.count, review.responded_reviews]
    limit: 500
    dynamic_fields: [{table_calculation: reviews_w_response, label: Reviews w/ Response,
        expression: "${review.responded_reviews}/${review.count}", value_format: !!null '',
        value_format_name: percent_1, _kind_hint: measure, _type_hint: number}]
    hidden_fields: [review.count, review.responded_reviews]
    series_types: {}
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 8
    col: 0
    width: 4
    height: 2
  - title: Last 14 Days vs Overall Rating
    name: Last 14 Days vs Overall Rating
    model: reviewtrackers_hospitality
    explore: review
    type: looker_bar
    fields: [location.location, review.recent_rating, review.rating_value]
    sorts: [review.recent_rating desc]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: review.recent_rating,
            id: review.recent_rating, name: Recent Rating}, {axisId: review.rating_value,
            id: review.rating_value, name: Rating Value}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      review.recent_rating: "#1ea8df"
      review.rating_value: "#353b49"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 12
    col: 0
    width: 12
    height: 6
  - title: Bad Reviews in Last 14 Days
    name: Bad Reviews in Last 14 Days
    model: reviewtrackers_hospitality
    explore: review
    type: table
    fields: [location.location, review.source, review.review_published_date, review.review_text_short,
      review.rating_stars, review.sentiment_value]
    filters:
      review.review_published_date: 14 days
      review.rating_value: "<4"
    sorts: [review.review_published_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Location: location.location
      Source: review.source
    row: 12
    col: 12
    width: 12
    height: 6
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 6 months
    allow_multiple_values: true
    required: false
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: reviewtrackers_hospitality
    explore: review
    listens_to_filters: []
    field: location.location
  - name: Source
    title: Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: reviewtrackers_hospitality
    explore: review
    listens_to_filters: []
    field: review.source
