view: global_top_terms {
  derived_table: {
    sql: WITH global AS (
        WITH international AS (SELECT
            refresh_date,
            week,
            rank,
            score,
            term,
            CAST(NULL AS INT64) as dma_id,
            CAST(NULL AS STRING) as dma_name,
            country_code,
            country_name,
            region_code,
            region_name,
            GENERATE_UUID() as primary_key
          FROM
            `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.international_top_terms`
            ), local AS (
              SELECT
                refresh_date,
                week,
                rank,
                score,
                term,
                CAST(dma_id AS INT64) as dma_id,
                dma_name,
                'US' as country_code,
                'United States' as country_name,
                CAST(NULL AS STRING) as region_code,
                CAST(NULL AS STRING) as region_name,
                GENERATE_UUID() as primary_key
              FROM
                `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.top_terms`)
            SELECT * fROM international
            UNION ALL
            SELECT * FROM local
            ), MAX_REFRESH_DATE AS (
              SELECT MAX(refresh_date) AS max_refresh_date FROM `@{TRENDS_PUBLIC_PROJECT_ID}.@{TRENDS_DATASET}.top_terms`
            )
            SELECT
              GENERATE_UUID() as primary_key,
              *
            FROM global CROSS JOIN MAX_REFRESH_DATE
            WHERE
            {% condition dynamic_country %} global.country_code {% endcondition %} ;;

        }

  fields_hidden_by_default: yes

  parameter: dynamic_country {
    type: unquoted
    hidden: no
    default_value: "US"
    suggest_dimension: country_code
  }

  dimension: max_refresh_date {
    sql: ${TABLE}.max_refresh_date ;;
  }

  dimension: primary_key {
    hidden: yes
    type: string
    sql: ${TABLE}.primary_key ;;
    primary_key: yes
  }

  dimension: term {
    drill_fields: []
    hidden: no
    link: {
      label: "Term Over time"
      url: "@{VIZ_CONFIG}{{ link }}&fields=global_top_terms.avg_score,global_top_terms.week_month&fill_fields=global_top_terms.week_month&sorts=global_top_terms.week_month+desc&limit=500&column_limit=50&vis_config={{ vis_config | encode_uri }}"
    }
    link: {
      label: "Term By Region"
      url: "@{VIZ_REGION}{{ link }}&fields=global_top_terms.avg_score,global_top_terms.region_name&sorts=global_top_terms.avg_score+desc+0&limit=500&column_limit=50&vis_config={{ vis_config | encode_uri }}"
    }

    link: {
      label: "Term Analysis Dashboard Global"
      url: "/dashboards/google_trends::global_term_analysis?Refresh+Date=yesterday&Dynamic+Country={{ _filters['global_top_terms.dynamic_country'] | encode_uri }}&Term=%25{{ value }}%25&Region+Name={{ _filters['global_top_terms.region_name'] | encode_uri }}&Term+is={{ value }}&Similar=%25{{ value | encode_uri }}%25%2C%25{% assign words = value | split: ' ' %}{{ words[0] | encode_uri }}%25%2C%25{{ words | last | encode_uri }}%25"
    }

  }

  dimension: dma_id {
    sql: ${TABLE}.dma_id ;;
  }
  dimension: dma_name {
    type: string
    sql: ${TABLE}.dma_name ;;
  }

  dimension: country_code {
    hidden: no
    type: string
    sql: ${TABLE}.country_code ;;
  }
  dimension: country_name {
    hidden: no
    type: string
    sql: ${TABLE}.country_name ;;
  }
  dimension: rank {
    hidden: no
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension_group: refresh {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: yes
    datatype: date
    sql: ${TABLE}.refresh_date ;;
  }
  dimension: region_code_1 {
    type: string
    sql: ${TABLE}.region_code ;;
  }
  dimension: region_name_1 {
    type: string
    sql: ${TABLE}.region_name ;;
  }
  dimension: score {
    hidden: no
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension_group: week {
    hidden: no
    type: time
    timeframes: [week, month, month_name, month_num, quarter, year]
    convert_tz: yes
    datatype: date
    sql: ${TABLE}.week ;;

  }

  dimension: region_code {
    type: string
    hidden: no
    label: "Region Code"
    sql:
      {% if dynamic_country._parameter_value != 'US' %}${region_code_1}
      {% elsif dynamic_country._parameter_value  == 'US' %} ${dma_id}
      {% else %} ${region_code_1}
      {% endif %} ;;
  }

  dimension: region_name {
    type: string
    hidden: no
    label: "Region Name"
    sql:
      {% if dynamic_country._parameter_value != 'US' %}${region_name_1}
      {% elsif dynamic_country._parameter_value  == 'US' %} ${dma_name}
      {% else %} ${region_name_1}
      {% endif %} ;;
  }

  measure: avg_score {
    hidden: no
    label: "Average Score  (Index)"
    type: average
    sql: ${score} ;;
    value_format_name: decimal_0
  }

  measure: avg_rank {
    hidden: no
    label: "Average Rank"
    type: average
    sql: ${rank} ;;
    value_format_name: decimal_0
  }

  measure: inverted_rank {
    type: number
    sql: 25 - ${rank} + 1 ;;
  }

  measure: normalized_weight {
    hidden: no
    type: percent_of_total
    sql: ${inverted_rank} ;;
    label: "Proportional weight (Word Cloud)"
    value_format_name: percent_0
  }
}
