{{
    config(
        materialized='incremental',
        alias='pre_post',
        pre_hook=["{% if is_incremental() %}
          truncate table {{ this }}
          {% endif %}"],
        post_hook=["create or view RAW.DBT_AP.v_SHOP as select * from systech_dbt.dbt_session.customer"]
    )
}}

select customerid,firstname,lastname from systech_dbt.dbt_session.customer

{% if is_incremental() %}
where customerid > (select max(customerid) from {{this}})
{% endif %}