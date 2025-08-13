view: international_top_rising_terms {

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }
  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }
  dimension: percent_gain {
    type: number
    sql: ${TABLE}.percent_gain ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension_group: refresh {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.refresh_date ;;
  }
  dimension: region_code {
    type: string
    sql: ${TABLE}.region_code ;;
  }
  dimension: region_name {
    type: string
    sql: ${TABLE}.region_name ;;
  }
  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }
  dimension: term {
    type: string
    sql: ${TABLE}.term ;;
  }
  dimension_group: week {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.week ;;
  }
  measure: count {
    type: count
    drill_fields: [country_name, region_name]
  }
}
