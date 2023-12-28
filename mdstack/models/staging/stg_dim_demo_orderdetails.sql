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

    from source
)
select * from renamed
  