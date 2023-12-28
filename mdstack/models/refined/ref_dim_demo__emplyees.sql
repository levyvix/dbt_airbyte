with employees as (
    select *
    from {{ ref('stg_dim_demo_employees') }}
),
offices as (
    select *
    from {{ref("stg_dim_demo_offices")}}
),
final as (
    select employees.*,
        offices.office_city,
        offices.office_phone,
        offices.office_state,
        offices.office_country,
        offices.office_postal_code,
        offices.office_territory
    from employees
    left join offices
        on employees.office_id = offices.office_id
)

select * from final