with source as (
      select * from {{ source('dim_demo', 'orders') }}
),
renamed as (
    select
        --ids 
        {{ adapter.quote("ordernumber") }} as order_id,
        {{ adapter.quote("customernumber") }} as customer_id,

        -- info
        {{ adapter.quote("status") }} as order_status,
        {{ adapter.quote("comments") }} as order_comments,
        {{ adapter.quote("orderdate") }} as ordered_date,
        {{ adapter.quote("shippeddate") }} as shipped_date,
        {{ adapter.quote("requireddate") }} as required_date,

        'dim_demo.orders' as record_source
        -- {{ adapter.quote("_ab_cdc_cursor") }},
        -- {{ adapter.quote("_ab_cdc_log_pos") }},
        -- {{ adapter.quote("_airbyte_unique_key") }},
        -- {{ adapter.quote("_ab_cdc_log_file") }},
        -- {{ adapter.quote("_ab_cdc_deleted_at") }},
        -- {{ adapter.quote("_ab_cdc_updated_at") }},
        -- {{ adapter.quote("_airbyte_ab_id") }},
        -- {{ adapter.quote("_airbyte_emitted_at") }},
        -- {{ adapter.quote("_airbyte_normalized_at") }},
        -- {{ adapter.quote("_airbyte_orders_hashid") }}

    from source
)
select * from renamed
  