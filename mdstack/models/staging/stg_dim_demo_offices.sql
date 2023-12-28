with source as (
      select * from {{ source('dim_demo', 'offices') }}
),
renamed as (
    select
        -- ids
        {{ adapter.quote("officecode") }} as office_id,

        -- info
        {{ adapter.quote("postalcode") }} as office_postal_code,
        {{ adapter.quote("city") }} as office_city,
        {{ adapter.quote("phone") }} as office_phone,
        {{ adapter.quote("state") }} as office_state,
        {{ adapter.quote("country") }} as office_country,
        {{ adapter.quote("territory") }} as office_territory,
        {{ adapter.quote("addressline1") }} as office_address_line_1,
        {{ adapter.quote("addressline2") }} as office_address_line_2,



        'dim_demo.offices' as record_source

    from source
)
select * from renamed 
  