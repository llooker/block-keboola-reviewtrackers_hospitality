- dashboard: voc__nlp_topic_analysis
  title: VoC - NLP Topic Analysis
  layout: newspaper
  elements:
  - name: ''
    type: text
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Voice of Customer</b></font>
    row: 0
    col: 0
    width: 7
    height: 2
  - name: " (2)"
    type: text
    subtitle_text: <font size="5px"><font color="#408ef7"><b>NLP Topic Analysis</b></font>
    row: 0
    col: 7
    width: 11
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    body_text: <a href="https://keboola.com" target="_blank"> <img src="https://keboola-resources.s3.amazonaws.com/poweredByKeboola.png"
      width="100%"/>
    row: 0
    col: 18
    width: 6
    height: 2
  - title: Top Subjects Sentiment Share in Topic Related Reviews
    name: Top Subjects Sentiment Share in Topic Related Reviews
    model: block_keboola_reviews_v2
    explore: review
    type: looker_bar
    fields: [attribute_relation.sentiment_label, attribute_relation.count, attribute_relation.subject]
    pivots: [attribute_relation.sentiment_label]
    filters:
      attribute_relation.sentiment_label: "-NULL"
    sorts: [attribute_relation.count desc 3, attribute_relation.sentiment_label 0]
    limit: 10
    row_total: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    series_types: {}
    series_colors:
      attribute_relation.count: "#ed6168"
      hierarchy_relation.count: "#e9b404"
      negative - attribute_relation.count: "#ed6168"
      neutral - attribute_relation.count: "#e9b404"
      positive - attribute_relation.count: "#49cec1"
    hidden_fields: []
    defaults_version: 1
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
      Topic object: hierarchy_relation.object
    row: 2
    col: 17
    width: 7
    height: 10
  - title: Review Related to Topic
    name: Review Related to Topic
    model: block_keboola_reviews_v2
    explore: review
    type: single_value
    fields: [review.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
      Topic object: hierarchy_relation.object
    row: 2
    col: 6
    width: 3
    height: 5
  - title: Rating  of Reviews Related to Topic
    name: Rating  of Reviews Related to Topic
    model: block_keboola_reviews_v2
    explore: review
    type: single_value
    fields: [review.rating_stars]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
      Topic object: hierarchy_relation.object
    row: 7
    col: 6
    width: 3
    height: 5
  - title: Most Mentioned Attribute Relations of the Topic
    name: Most Mentioned Attribute Relations of the Topic
    model: block_keboola_reviews_v2
    explore: review
    type: looker_wordcloud
    fields: [attribute_relation.count, attribute_relation.attribute_relation]
    limit: 20
    color_application: undefined
    series_types: {}
    defaults_version: 1
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
      Topic object: hierarchy_relation.object
    row: 12
    col: 0
    width: 8
    height: 8
  - title: Last Reviews Related to the Topic
    name: Last Reviews Related to the Topic
    model: block_keboola_reviews_v2
    explore: review
    type: looker_grid
    fields: [review.review_published_date, review.review_title, review.review_text_short,
      review.source, review.rating_stars]
    sorts: [review.review_published_date desc]
    limit: 100
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application: undefined
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      review.rating_stars:
        is_active: false
    series_types: {}
    defaults_version: 1
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
      Topic object: hierarchy_relation.object
    row: 12
    col: 8
    width: 16
    height: 8
  - title: Entities Related to Topic Object
    name: Entities Related to Topic Object
    model: block_keboola_reviews_v2
    explore: review
    type: looker_pie
    fields: [review.count, hierarchy_relation.entity]
    filters:
      hierarchy_relation.entity: "-NULL"
    sorts: [review.count desc]
    limit: 50
    column_limit: 50
    row_total: right
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: legacy
      custom:
        id: 0ad3f6a4-4c76-5f66-b50c-49e7832c52f4
        label: Custom
        type: continuous
        stops:
        - color: "#EA626A"
          offset: 0
        - color: "#E7B32A"
          offset: 50
        - color: "#50CEC0"
          offset: 100
      options:
        steps: 5
    series_colors: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: negative - review.count,
            id: negative - review.count, name: negative}, {axisId: neutral - review.count,
            id: neutral - review.count, name: neutral}, {axisId: positive - review.count,
            id: positive - review.count, name: positive}], showLabels: false, showValues: true,
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
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
      Topic object: hierarchy_relation.object
    row: 2
    col: 0
    width: 6
    height: 10
  - title: Topic Related Reviews by Location and Rating
    name: Topic Related Reviews by Location and Rating
    model: block_keboola_reviews_v2
    explore: review
    type: looker_bar
    fields: [review.count, location.location, review.rating_dimension]
    pivots: [review.rating_dimension]
    filters:
      entity.sentiment_label: "-NULL"
    sorts: [review.count desc 0, review.rating_dimension]
    limit: 10
    column_limit: 50
    row_total: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    color_application:
      collection_id: legacy
      custom:
        id: e7d47a54-fea4-594d-4151-c8b051066ddd
        label: Custom
        type: continuous
        stops:
        - color: "#EA626A"
          offset: 0
        - color: "#E7B32A"
          offset: 50
        - color: "#50CEC0"
          offset: 100
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: negative - review.count,
            id: negative - review.count, name: negative}, {axisId: neutral - review.count,
            id: neutral - review.count, name: neutral}, {axisId: positive - review.count,
            id: positive - review.count, name: positive}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors: {}
    defaults_version: 1
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
      Topic object: hierarchy_relation.object
    row: 2
    col: 9
    width: 8
    height: 10
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
    model: block_keboola_reviews_v2
    explore: review
    listens_to_filters: []
    field: location.location
  - name: Source
    title: Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_keboola_reviews_v2
    explore: review
    listens_to_filters: []
    field: review.source
  - name: Topic object
    title: Topic object
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    model: block_keboola_reviews_v2
    explore: review
    listens_to_filters: []
    field: hierarchy_relation.object