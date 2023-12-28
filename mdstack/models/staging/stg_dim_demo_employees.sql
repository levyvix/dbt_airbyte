with source as (
      select * from {{ source('dim_demo', 'employees') }}
),
renamed as (
    select
        -- ids
        {{ adapter.quote("employeenumber") }} as employee_id,
        {{ adapter.quote("officecode") }} as office_id,
        {{ adapter.quote("reportsto") }} as employee_boss_id,

        -- info
        {{ adapter.quote("email") }} as employee_email,
        {{ adapter.quote("jobtitle") }} as employee_job_title,
        {{ adapter.quote("lastname") }} as employee_last_name,
        {{ adapter.quote("extension") }} as employee_extension,
        {{ adapter.quote("firstname") }} as employee_first_name,



        'dim_demo.employees' as record_source
        -- {{ adapter.quote("_ab_cdc_cursor") }},
        -- {{ adapter.quote("_airbyte_unique_key") }},
        -- {{ adapter.quote("_ab_cdc_log_pos") }},
        -- {{ adapter.quote("_ab_cdc_log_file") }},
        -- {{ adapter.quote("_ab_cdc_deleted_at") }},
        -- {{ adapter.quote("_ab_cdc_updated_at") }},
        -- {{ adapter.quote("_airbyte_ab_id") }},
        -- {{ adapter.quote("_airbyte_emitted_at") }},
        -- {{ adapter.quote("_airbyte_normalized_at") }},
        -- {{ adapter.quote("_airbyte_employees_hashid") }}

    from source
)
select * from renamed
  