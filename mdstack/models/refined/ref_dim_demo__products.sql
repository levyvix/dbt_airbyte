with products as (
    select *
    from {{ref("stg_dim_demo_products")}}
),
product_lines as (
    select *
    from {{ref("stg_dim_demo_productlines")}}
),
final as (

    select
        products.*, 
        product_lines.product_line_text_description
    from products
    left join product_lines
        on products.product_line_id = product_lines.product_line_id
)
select * from final