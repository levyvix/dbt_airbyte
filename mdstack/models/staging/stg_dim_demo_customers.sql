with source as (
      select * from {{ source('dim_demo', 'customers') }}
),
renamed as (
    select
        -- ids
        {{ adapter.quote("customernumber") }}::int as customer_id,
        {{ adapter.quote("salesrepemployeenumber") }}::int as customer_sales_rep_id,
        -- {{ adapter.quote("_airbyte_unique_key") }},

        -- info
        {{ adapter.quote("city") }}::text as customer_city,
        {{ adapter.quote("phone") }}::text as customer_phone,
        {{ adapter.quote("state") }}::text as customer_state,
        {{ adapter.quote("country") }}::text as customer_country,
        {{ adapter.quote("postalcode") }}::text as customer_postal_code,
        {{ adapter.quote("creditlimit") }}::real as customer_credit_limit,
        {{ adapter.quote("addressline1") }}::text as customer_address_line_1,
        {{ adapter.quote("addressline2") }}::text as customer_address_line_2,
        {{ adapter.quote("customername") }}::text as customer_name,
        {{ adapter.quote("contactfirstname") }}::text as customer_contact_first_name,
        {{ adapter.quote("contactlastname") }}::text as customer_contact_last_name,


        'dim_demo.customers' as record_source
        -- {{ adapter.quote("_ab_cdc_cursor") }},
        -- {{ adapter.quote("_ab_cdc_log_pos") }},
        -- {{ adapter.quote("_ab_cdc_log_file") }} ,
        -- {{ adapter.quote("_ab_cdc_deleted_at") }},
        -- {{ adapter.quote("_ab_cdc_updated_at") }},


        -- {{ adapter.quote("_airbyte_ab_id") }},
        -- {{ adapter.quote("_airbyte_emitted_at") }},
        -- {{ adapter.quote("_airbyte_normalized_at") }},
        -- {{ adapter.quote("_airbyte_customers_hashid") }}

    from source
)
select * from renamed
  