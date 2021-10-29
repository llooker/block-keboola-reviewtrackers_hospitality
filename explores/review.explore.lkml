include: "/views/review.view"
include: "/views/entity.view"
include: "/views/location.view"
include: "/views/attribute_relation.view"
include: "/views/hierarchy_relation.view"
include: "/views/sentence.view"
include: "/views/tag.view"

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
