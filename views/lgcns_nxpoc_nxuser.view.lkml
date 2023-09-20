view: lgcns_nxpoc_nxuser {
  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_NXUSER_SEG` ;;

  dimension_group: creation {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.creation_date ;;
  }
  dimension: is_main_account {
    type: string
    sql: ${TABLE}.is_main_account ;;
  }
  dimension_group: last_update {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.last_update_date ;;
  }
  dimension: new_or_return_user {
    type: string
    sql: ${TABLE}.new_or_return_user ;;
  }
  dimension: nexonsn {
    type: number
    sql: ${TABLE}.nexonsn ;;
  }
  dimension: same_response_ratio {
    type: number
    sql: ${TABLE}.same_response_ratio ;;
  }
  dimension_group: sdate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sdate ;;
  }
  dimension: survey2_id {
    type: string
    sql: ${TABLE}.survey2_id ;;
  }
  dimension: survey2_name {
    type: string
    sql: ${TABLE}.survey2_name ;;
  }
  dimension: survey3_id {
    type: string
    sql: ${TABLE}.survey3_id ;;
  }
  dimension: survey3_name {
    type: string
    sql: ${TABLE}.survey3_name ;;
  }
  dimension: survey_group {
    type: string
    sql: ${TABLE}.survey_group ;;
  }
  dimension: survey_type {
    type: string
    sql: ${TABLE}.survey_type ;;
  }
  dimension: user_segmentation {
    type: string
    sql: ${TABLE}.user_segmentation ;;
  }
  parameter: dynamic_dimension_selection {
    label: "그룹"
    type: unquoted
    default_value: "segmentation"
    allowed_value: {
      value: "segmentation"
      label: "유저 그룹"}
    allowed_value: {
      value: "return"
      label: "신규/복귀"}
  }
  dimension: dynamic_dimension {
    label_from_parameter: dynamic_dimension_selection
    type: string
    sql:
    {% if dynamic_dimension_selection._parameter_value == 'segmentation' %}
    ${user_segmentation}
    {% else %}
    ${new_or_return_user}
    {% endif %} ;;
  }
  measure: count {
    type: count
    drill_fields: [survey3_name, survey2_name]
  }
}
