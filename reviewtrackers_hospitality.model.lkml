connection: "reviewtrackers_hospitality"

include: "/views/**/*.view"

# include all lookml dashboards
#include: "*.dashboard.lookml"

datagroup: reviewtrackers_default_datagroup {
  sql_trigger: SELECT MAX(REVIEW_ID) FROM REVIEW;;
  max_cache_age: "24 hours"
}

persist_with: reviewtrackers_default_datagroup

explore: review {

  join: entity {
    type: left_outer
    sql_on: ${review.review_id} = ${entity.review_id} ;;
    relationship: one_to_many
  }

  join: location {
    type: left_outer
    sql_on: ${review.location_id} = ${location.location_id} ;;
    relationship: many_to_one
  }

  join: attribute_relation {
    type: left_outer
    sql_on: ${review.review_id} = ${attribute_relation.review_id} ;;
    relationship: one_to_many
  }

  join: hierarchy_relation {
    type: left_outer
    sql_on: ${review.review_id} = ${hierarchy_relation.review_id} ;;
    relationship: one_to_many
  }

  join: sentence {
    type: left_outer
    sql_on: ${review.review_id} = ${sentence.review_id} ;;
    relationship: one_to_many
  }

  join: tag {
    type: left_outer
    sql_on: ${review.review_id} = ${tag.review_id} ;;
    relationship: one_to_many
  }

}
