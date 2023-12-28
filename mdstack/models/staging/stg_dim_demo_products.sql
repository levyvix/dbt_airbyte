with source as (
      select * from {{ source('dim_demo', 'products') }}
),
renamed as (
    select
        {{ adapter.quote("productcode") }} as product_id,
        {{ adapter.quote("productline") }} as product_line_id,
        {{ adapter.quote("productname") }} as product_name,
        {{ adapter.quote("productdescription") }} as product_description,
        {{ adapter.quote("productscale") }} as product_scale, 
        {{ adapter.quote("productvendor") }} as product_vendor,

        {{ adapter.quote("quantityinstock") }} as product_quantity_in_stock,
        {{ adapter.quote("msrp") }} as msrp,
        {{ adapter.quote("buyprice") }} as buy_price,

        'dim_demo.products' as record_source

    from source
)
select * from renamed