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

    from source
)
select * from renamed
  