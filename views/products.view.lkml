view: products {
  sql_table_name: PUBLIC.PRODUCTS ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}."BRAND";;
    drill_fields: [category]
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
    drill_fields: [department]
  }

  dimension: cost {
    type: number
    value_format: "0"
    sql: ${TABLE}."COST" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."DISTRIBUTION_CENTER_ID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
    link: {
      label: "Demo dasboard"
      url: "/dashboards/200?name={{ value | encode_uri }}"
    }

  }

  dimension: retail_price {
    type: number
    value_format: "0"
    sql: ${TABLE}."RETAIL_PRICE" ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}."SKU" ;;
  }

  measure: count {
    type: count
    drill_fields: [brand]
  }
  measure: Avg_of_retail_price {
    type: average
    sql: ${retail_price} ;;
    value_format: "0.00"
  }
  measure: max {
    type: max
    sql: ${retail_price} ;;
  }
  measure: min {
    type: min
    sql: ${retail_price} ;;
  }

}
