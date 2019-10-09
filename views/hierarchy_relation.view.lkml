view: hierarchy_relation {
  sql_table_name: HIERARCHY_RELATION ;;

  dimension: hierarchy_relation_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."HIERARCHY_RELATION_ID" ;;
  }

  dimension: entity {
    type: string
    sql: ${TABLE}."ENTITY" ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}."OBJECT" ;;
  }

  dimension: review_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."REVIEW_ID" ;;
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

  measure: hierarchy_sentiment_value {
    label: "Hierarchy Sentiment Value"
    type: average
    sql: ${sentiment_value_dimension} ;;
    value_format: "# ##0.0#"
    drill_fields: [detail*, hierarchy_sentiment_value]
  }

  measure: count {
    label: "Relations"
    type: count
    drill_fields: [detail*, object, entity, count]
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
