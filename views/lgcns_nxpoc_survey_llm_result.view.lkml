view: lgcns_nxpoc_survey_llm_result {
  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_SURVEY_LLM_RESULT` ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: criteria {
    type: string
    sql: ${TABLE}.criteria ;;
  }
  dimension: criteria_id {
    type: string
    sql: ${TABLE}.criteria_id ;;
  }
  dimension: summary_subjective_answer {
    type: string
    sql: ${TABLE}.summary_subjective_answer ;;
  }
}
