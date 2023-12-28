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

    from source
)
select * from renamed
  