with source as (
      select * from {{ source('dim_demo', 'orderdetails') }}
),
renamed as (
    select

        -- ids
        {{ adapter.quote("orderlinenumber") }} as order_line_id,
        {{ adapter.quote("ordernumber") }} as order_id,
        {{ adapter.quote("productcode") }} as product_id,
        {{ adapter.quote("priceeach") }} as order_line_price_each,
        {{ adapter.quote("quantityordered") }} as order_line_quantity_ordered,


        'dim_demo.orderdetails' as record_source
        -- {{ adapter.quote("_ab_cdc_cursor") }},
        -- {{ adapter.quote("_ab_cdc_log_pos") }},
        -- {{ adapter.quote("_airbyte_unique_key") }},
        -- {{ adapter.quote("_ab_cdc_log_file") }},
        -- {{ adapter.quote("_ab_cdc_deleted_at") }},
        -- {{ adapter.quote("_airbyte_emitted_at") }},
        -- {{ adapter.quote("_ab_cdc_updated_at") }},
        -- {{ adapter.quote("_airbyte_ab_id") }},
        -- {{ adapter.quote("_airbyte_normalized_at") }},
        -- {{ adapter.quote("_airbyte_orderdetails_hashid") }}

    from source
)
select * from renamed
  