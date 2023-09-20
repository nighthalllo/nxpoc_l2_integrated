connection: "nxpoc_l2_integrated"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: nxpoc_l2_integrated_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: nxpoc_l2_integrated_default_datagroup

explore: lgcns_nxpoc_surveyform {}

explore: lgcns_nxpoc_survey {
  join: lgcns_nxpoc_nxuser {
    type: left_outer
    sql_on: ${lgcns_nxpoc_survey.nexonsn} = ${lgcns_nxpoc_nxuser.nexonsn} ;;
    relationship: many_to_one
  }
  join: lgcns_nxpoc_surveyform {
    type: left_outer
    sql_on: ${lgcns_nxpoc_survey.question_id} = ${lgcns_nxpoc_surveyform.question_id} ;;
    relationship: many_to_one
  }
}

explore: lgcns_nxpoc_nxuser {}

explore: lgcns_nxpoc_survey_llm_result {}
