view: sentence {
  sql_table_name: @{SCHEMA_NAME}.SENTENCE ;;

  dimension: sentence_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}."SENTENCE_ID" ;;
  }

  dimension: order {
    type: number
    sql: ${TABLE}."ORDER" ;;
  }

  dimension: review_id {
    type: string
    hidden: yes
    sql: ${TABLE}."REVIEW_ID" ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}."SEGMENT" ;;
  }

  dimension: sentence {
    type: string
    sql: ${TABLE}."SENTENCE" ;;
  }

  dimension: sentiment_label {
    type: string
    sql: ${TABLE}."SENTIMENT_LABEL" ;;
  }

  dimension: sentiment_value_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."SENTIMENT_VALUE" ;;
  }

  measure: sentence_sentiment_value {
    label: "Sentence Sentiment Value"
    type: average
    sql: ${sentiment_value_dimension} ;;
    value_format: "# ##0.0#"
    drill_fields: [detail*, sentence_sentiment_value]
  }

  measure: count {
    label: "Sentences"
    type: count
    drill_fields: [detail*, count]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      location.location,
      review.review_published_date,
      review.review_text_short,
      review.source,
      review.rating_stars,
      sentiment_label
    ]
  }
}
