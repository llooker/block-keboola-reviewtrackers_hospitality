view: attribute_relation {
  sql_table_name: @{SCHEMA_NAME}.ATTRIBUTE_RELATION ;;

  dimension: attribute_relation_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}."ATTRIBUTE_RELATION_ID" ;;
  }

  dimension: attribute {
    type: string
    sql: ${TABLE}."ATTRIBUTE" ;;
  }

  dimension: review_id {
    type: string
    hidden: yes
    sql: ${TABLE}."REVIEW_ID" ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}."SUBJECT" ;;
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

  dimension: attribute_relation {
    type: string
    sql: CONCAT(${attribute}, ' ', ${subject}) ;;
  }

  measure: attribute_sentiment_value {
    label: "Attribute Sentiment Value"
    type: average
    sql: ${sentiment_value_dimension} ;;
    value_format: "# ##0.0#"
    drill_fields: [detail*, attribute_sentiment_value]
  }

  measure: count {
    label: "Relations"
    type: count
    drill_fields: [detail*, subject, attribute, count]
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
