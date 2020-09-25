include: "//@{CONFIG_PROJECT_NAME}/review.view"

view: review {
  extends: [review_config]
}

view: review_core {
  sql_table_name: @{SCHEMA_NAME}.REVIEW ;;

  dimension: review_id {
    label: "Review ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."REVIEW_ID" ;;
  }

  dimension: has_response {
    type: string
    sql: ${TABLE}."HAS_RESPONSE" ;;
  }

  dimension: location_id {
    type: string
    hidden: yes
    sql: ${TABLE}."LOCATION_ID" ;;
  }

  dimension_group: response_published {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}."RESPONSE_PUBLISHED_AT" ;;
  }

  dimension_group: review_published {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}."REVIEW_PUBLISHED_AT" ;;
  }

  dimension: review_text {
    type: string
    sql: ${TABLE}."REVIEW_TEXT" ;;
  }

  dimension: review_text_short {
    type: string
    sql: (CASE
            WHEN LENGTH(${review_text})>256
            THEN LEFT(${review_text},253)||'...'
            ELSE ${review_text}
          END) ;;
    drill_fields: [detail*, review_text]
  }

  dimension: review_title {
    type: string
    sql: ${TABLE}."REVIEW_TITLE" ;;
  }

  dimension: response_text {
    type: string
    sql: ${TABLE}."RESPONSE_TEXT" ;;
  }

  dimension: response_text_short {
    type: string
    sql: (CASE
            WHEN LENGTH(${response_text})>256
            THEN LEFT(${response_text},253)||'...'
            ELSE ${response_text})
          END) ;;
    drill_fields: [detail*, review_text]
  }

  dimension: sentiment_label {
    label: "Review Sentiment Label"
    type: string
    sql: ${TABLE}."SENTIMENT_LABEL" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
    html: <a href={{source_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: source_url {
    hidden: yes
    type: string
    sql: ${TABLE}."SOURCE_URL" ;;
  }

  dimension: sentiment_value_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."SENTIMENT_VALUE" ;;
  }

  dimension: review_text_length_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."REVIEW_TEXT_LENGTH" ;;
  }

  dimension: rating_dimension {
    label: "Rating"
    type: number
    sql: ${TABLE}."RATING" ;;
  }

  dimension: days_to_response_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."DAYS_TO_RESPONSE" ;;
  }

  measure: rating_value {
    type: average
    sql: ${rating_dimension} ;;
    value_format: "# ##0.0#"
    drill_fields: [detail*, rating_value]
  }

  measure: recent_rating {
    type: average
    sql: ${rating_dimension} ;;
    filters: {
      field: review_published_date
      value: "last 14 days"
    }
    view_label: ""
    value_format: "# ##0.0#"
    drill_fields: [detail*, recent_rating]
  }

  measure: old_rating {
    description: "14 days ago"
    type: average
    sql: ${rating_dimension} ;;
    filters: {
      field: review_published_date
      value: "before 14 days ago"
    }
    view_label: ""
    value_format: "# ##0.0#"
    drill_fields: [detail*, old_rating]
  }

  measure: rating_stars {
    type: average
    sql: ${rating_dimension} ;;
    view_label: ""
    html:
      {%if {{value}} > 0.5%}
        {%if {{value}} > 1.5%}
          {%if {{value}} > 2.5%}
            {%if {{value}} > 3.5%}
              {%if {{value}} > 4.5%}
              ✪ ✪ ✪ ✪ ✪
              {%else%}
              ✪ ✪ ✪ ✪
              {%endif%}
            {%else%}
            ✪ ✪ ✪
            {%endif%}
          {%else%}
          ✪ ✪
          {%endif%}
        {%else%}
        ✪
        {%endif%}
      {%else%}
      💩
      {%endif%};;
  }

  measure: sentiment_value {
    label: "Review Sentiment Value"
    type: average
    sql: ${sentiment_value_dimension} ;;
    value_format: "# ##0.0#"
    drill_fields: [detail*, sentiment_value]
  }

  measure: review_text_length {
    type: average
    sql: ${review_text_length_dimension} ;;
  }

  measure: days_to_response {
    type: average
    sql: ${days_to_response_dimension} ;;
  }

  measure: count {
    label: "Reviews"
    type: count
    drill_fields: [detail*, count]
  }

  measure: responded_reviews {
    type: count
    filters: {
      field: has_response
      value: "true"
    }
    drill_fields: [detail*, responded_reviews]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      location.location,
      review_published_date,
      source,
      review_text_short,
      response_text_short,
      rating_stars,
      sentiment_label
    ]
  }
}
