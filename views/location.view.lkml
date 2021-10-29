view: location {
  sql_table_name: @{SCHEMA_NAME}.LOCATION ;;

  dimension: location_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}."LOCATION_ID" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}."LOCATION" ;;
  }

  dimension: latitude {
    hidden: yes
    type: string
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: longitude {
    hidden: yes
    type: string
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: location_gps {
    type: location
    label: "Location GPS"
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}."STREET" ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}."ZIPCODE" ;;
  }

  measure: count {
    label: "Locations"
    type: count
    drill_fields: [country, city, count]
  }
}
