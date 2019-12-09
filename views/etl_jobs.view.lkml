view: etl_jobs {
  sql_table_name: PUBLIC.ETL_JOBS ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: completed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      month_name,
      month,
      quarter,
      quarter_of_year,
      year
    ]
    sql: ${TABLE}."COMPLETED_AT" ;;
  }

  measure: count {
    type: count
    drill_fields: [completed_month_name]
  }
}
