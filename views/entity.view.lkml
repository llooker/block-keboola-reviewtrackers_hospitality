view: entity {
  sql_table_name: ENTITY ;;

  dimension: entity_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}."ENTITY_ID" ;;
  }

  dimension: entity {
    type: string
    sql: ${TABLE}."ENTITY" ;;
  }

  dimension: entity_type {
    type: string
    sql: ${TABLE}."ENTITY_TYPE" ;;
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

  measure: entity_sentiment_value {
    label: "Entity Sentiment Value"
    type: average
    sql: ${sentiment_value_dimension} ;;
    value_format: "# ##0.0#"
    drill_fields: [detail*, entity_sentiment_value]
  }

  measure: count {
    label: "Entities"
    type: count
    drill_fields: [detail*, entity_type, entity, count]
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
