- dashboard: voc__nlp_analysis
  title: VoC - NLP Analysis
  layout: newspaper
  elements:
  - title: Rating 5
    name: Rating 5
    model: block_keboola_reviews
    explore: review
    type: table
    fields: [attribute_relation.subject, review.count]
    filters:
      review.rating_dimension: '5'
      attribute_relation.subject: "-NULL"
    sorts: [review.count desc]
    limit: 10
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
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 22
    col: 4
    width: 4
    height: 6
  - name: Most Mentioned Subjects by Rating
    type: text
    title_text: Most Mentioned Subjects by Rating
    row: 20
    col: 4
    width: 20
    height: 2
  - title: Most Mentioned Entities
    name: Most Mentioned Entities
    model: block_keboola_reviews
    explore: review
    type: looker_wordcloud
    fields: [entity.entity, entity.count]
    limit: 20
    series_types: {}
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 14
    col: 0
    width: 10
    height: 6
  - title: Average Sentiment
    name: Average Sentiment
    model: block_keboola_reviews
    explore: review
    type: looker_line
    fields: [review.sentiment_value, review.review_published_week]
    filters:
      review.sentiment_value: NOT NULL
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
            id: review.sentiment_value, name: Review Sentiment Value}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
      review.sentiment_value: "#353b49"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}]
    show_null_points: true
    interpolation: linear
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 22
    col: 0
    width: 4
    height: 6
  - title: Rating 4
    name: Rating 4
    model: block_keboola_reviews
    explore: review
    type: table
    fields: [attribute_relation.subject, review.count]
    filters:
      review.rating_dimension: '4'
      attribute_relation.subject: "-NULL"
    sorts: [review.count desc]
    limit: 10
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
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 22
    col: 8
    width: 4
    height: 6
  - title: Rating 3
    name: Rating 3
    model: block_keboola_reviews
    explore: review
    type: table
    fields: [attribute_relation.subject, review.count]
    filters:
      review.rating_dimension: '3'
      attribute_relation.subject: "-NULL"
    sorts: [review.count desc]
    limit: 10
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
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 22
    col: 12
    width: 4
    height: 6
  - title: Rating 2
    name: Rating 2
    model: block_keboola_reviews
    explore: review
    type: table
    fields: [attribute_relation.subject, review.count]
    filters:
      review.rating_dimension: '2'
      attribute_relation.subject: "-NULL"
    sorts: [review.count desc]
    limit: 10
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
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 22
    col: 16
    width: 4
    height: 6
  - title: Rating 1
    name: Rating 1
    model: block_keboola_reviews
    explore: review
    type: table
    fields: [attribute_relation.subject, review.count]
    filters:
      review.rating_dimension: '1'
      attribute_relation.subject: "-NULL"
    sorts: [review.count desc]
    limit: 10
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
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 22
    col: 20
    width: 4
    height: 6
  - name: Sentiment KPI
    type: text
    title_text: Sentiment KPI
    row: 20
    col: 0
    width: 4
    height: 2
  - name: ''
    type: text
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Voice of Customer</b></font>
    row: 0
    col: 0
    width: 7
    height: 2
  - name: " (2)"
    type: text
    subtitle_text: <font size="5px"><font color="#408ef7"><b>NLP Analysis</b></font>
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
  - title: Top 10 Entities Sentiment
    name: Top 10 Entities Sentiment
    model: block_keboola_reviews
    explore: review
    type: looker_bar
    fields: [entity.entity, review.count, entity.sentiment_label]
    pivots: [entity.sentiment_label]
    filters:
      entity.entity: "-NULL"
    sorts: [review.count desc 3, entity.sentiment_label 0]
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
        id: a9588210-ca0c-ccce-ac54-4d9e8a6033d8
        label: Custom
        type: continuous
        stops:
        - color: "#ea626a"
          offset: 0
        - color: "#e7b32a"
          offset: 50
        - color: "#50cec0"
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
    row: 2
    col: 0
    width: 10
    height: 6
  - title: Top Attribute Relations w/ Negative Sentiment
    name: Top Attribute Relations w/ Negative Sentiment
    model: block_keboola_reviews
    explore: review
    type: looker_bar
    fields: [attribute_relation.count, attribute_relation.attribute_relation]
    filters:
      attribute_relation.sentiment_label: negative
    sorts: [attribute_relation.count desc]
    limit: 10
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: attribute_relation.count,
            id: attribute_relation.count, name: Relations}, {axisId: review.rating_value,
            id: review.rating_value, name: Rating Value}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      attribute_relation.count: "#ed6168"
    hidden_fields: []
    defaults_version: 1
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 2
    col: 10
    width: 14
    height: 6
  - title: Top Attribute Relations w/ Positive Sentiment
    name: Top Attribute Relations w/ Positive Sentiment
    model: block_keboola_reviews
    explore: review
    type: looker_bar
    fields: [attribute_relation.count, attribute_relation.attribute_relation]
    filters:
      attribute_relation.sentiment_label: positive
    sorts: [attribute_relation.count desc]
    limit: 10
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: attribute_relation.count,
            id: attribute_relation.count, name: Relations}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      attribute_relation.count: "#49cec1"
    hidden_fields: []
    defaults_version: 1
    listen:
      Date: review.review_published_date
      Location: location.location
      Source: review.source
    row: 8
    col: 10
    width: 14
    height: 6
  - title: Top Subjects Sentiment Share
    name: Top Subjects Sentiment Share
    model: block_keboola_reviews
    explore: review
    type: looker_bar
    fields: [attribute_relation.sentiment_label, attribute_relation.count, attribute_relation.subject]
    pivots: [attribute_relation.sentiment_label]
    filters:
      attribute_relation.sentiment_label: "-NULL"
    sorts: [attribute_relation.count desc 2, attribute_relation.sentiment_label 0]
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: negative - attribute_relation.count,
            id: negative - attribute_relation.count, name: negative}, {axisId: neutral
              - attribute_relation.count, id: neutral - attribute_relation.count,
            name: neutral}, {axisId: positive - attribute_relation.count, id: positive
              - attribute_relation.count, name: positive}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    row: 14
    col: 10
    width: 14
    height: 6
  - title: Locations Reviews Sentiment
    name: Locations Reviews Sentiment
    model: block_keboola_reviews
    explore: review
    type: looker_bar
    fields: [review.count, location.location, review.sentiment_label]
    pivots: [review.sentiment_label]
    filters:
      review.sentiment_label: "-NULL"
    sorts: [review.count desc 3, review.sentiment_label]
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
        id: 53e10800-30b6-82cc-988f-b1f73f46912e
        label: Custom
        type: continuous
        stops:
        - color: "#ea626a"
          offset: 0
        - color: "#e7b32a"
          offset: 50
        - color: "#50cec0"
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
    row: 8
    col: 0
    width: 10
    height: 6
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 3 months
    allow_multiple_values: true
    required: false
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_keboola_reviews
    explore: review
    listens_to_filters: []
    field: location.location
  - name: Source
    title: Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_keboola_reviews
    explore: review
    listens_to_filters: []
    field: review.source
