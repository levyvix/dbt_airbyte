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
        -- {{ adapter.quote("_airbyte_unique_key") }},
        -- {{ adapter.quote("_ab_cdc_cursor") }},
        -- {{ adapter.quote("_ab_cdc_log_pos") }},
        -- {{ adapter.quote("_ab_cdc_log_file") }},
        -- {{ adapter.quote("_ab_cdc_deleted_at") }},
        -- {{ adapter.quote("_ab_cdc_updated_at") }},
        -- {{ adapter.quote("_airbyte_ab_id") }},
        -- {{ adapter.quote("_airbyte_emitted_at") }},
        -- {{ adapter.quote("_airbyte_normalized_at") }},
        -- {{ adapter.quote("_airbyte_offices_hashid") }}

    from source
)
select * from renamed 
  