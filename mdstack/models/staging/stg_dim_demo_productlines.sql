with source as (
      select * from {{ source('dim_demo', 'productlines') }}
),
renamed as (
    select
        {{ adapter.quote("productline") }} as product_line_id,
        {# {{ adapter.quote("image") }} as product_line_image_blob, #}
        {# {{ adapter.quote("htmldescription") }} as product_line_html_description, #}
        {{ adapter.quote("textdescription") }} as product_line_text_description,

        'dim_demo.productlines' as record_source

    from source
)
select * from renamed
  