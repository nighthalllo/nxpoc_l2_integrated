view: lgcns_nxpoc_survey {
  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_SURVEY` ;;

  dimension: answer_content {
    type: string
    sql: ${TABLE}.answer_content ;;
  }
  dimension: answer_content_matrix {
    type: string
    sql: ${TABLE}.answer_content_matrix ;;
  }
  dimension: answer_etc {
    type: string
    sql: ${TABLE}.answer_etc ;;
  }
  dimension: answer_id {
    type: number
    sql: ${TABLE}.answer_id ;;
  }
  dimension_group: creation {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.creation_date ;;
  }
  dimension_group: last_update {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.last_update_date ;;
  }
  dimension: nexonsn {
    type: number
    sql: ${TABLE}.nexonsn ;;
  }
  dimension: num_answer_content_matrix {
    type: number
    sql: ${TABLE}.num_answer_content_matrix ;;
  }
  dimension: question_id {
    type: string
    sql: ${TABLE}.question_id ;;
  }
  dimension: question_title {
    type: string
    sql: ${TABLE}.question_title ;;
  }
  dimension: survey3_id {
    type: string
    sql: ${TABLE}.survey3_id ;;
  }
  dimension: survey3_name {
    type: string
    sql: ${TABLE}.survey3_name ;;
  }
  dimension: question_title_filtered {
    sql: (SELECT DISTINCT(${question_title}) FROM ${TABLE} WHERE survey3_name = ${TABLE}.survey3_id ;;
  }
  measure: count {
    type: count
    drill_fields: [survey3_name]
  }
}
