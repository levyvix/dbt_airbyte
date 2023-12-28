with source as (
      select * from {{ source('dim_demo', 'payments') }}
),
renamed as (
    select

        -- ids
        {{ adapter.quote("checknumber") }} as payment_id,
        {{ adapter.quote("customernumber") }} as customer_id,

        -- amounts
        {{ adapter.quote("amount") }} as payment_amount,
        {{ adapter.quote("paymentdate") }} as payed_date,



        'dim_demo.payments' as record_source
        -- {{ adapter.quote("_ab_cdc_cursor") }},
        -- {{ adapter.quote("_ab_cdc_log_pos") }},
        -- {{ adapter.quote("_ab_cdc_log_file") }},
        -- {{ adapter.quote("_ab_cdc_deleted_at") }},
        -- {{ adapter.quote("_airbyte_unique_key") }},
        -- {{ adapter.quote("_ab_cdc_updated_at") }},
        -- {{ adapter.quote("_airbyte_ab_id") }},
        -- {{ adapter.quote("_airbyte_emitted_at") }},
        -- {{ adapter.quote("_airbyte_normalized_at") }},
        -- {{ adapter.quote("_airbyte_payments_hashid") }}

    from source
)
select * from renamed
  