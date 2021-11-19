view: tag {
  sql_table_name: @{SCHEMA_NAME}.TAG ;;

  dimension: tag_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."TAG_ID" ;;
  }

  dimension: review_id {
    type: string
    hidden: yes
    sql: ${TABLE}."REVIEW_ID" ;;
  }

  dimension: tag {
    type: string
    sql: ${TABLE}."TAG" ;;
  }

  measure: count {
    label: "Tags"
    type: count
    drill_fields: [detail*, count]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      location.location,
      review.review_published_date,
      review.source,
      review.rating_stars
    ]
  }
}
