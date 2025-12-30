{{ config(materialized='table',
database='SURESHDB',
alias='DQ_NULL_ITEMLINES') }}

WITH dq_check as (
    {{ check_nulls(ref('stg_itemlines'), ['L_ORDERKEY', 'L_PARTKEY', 'L_SUPPKEY']) }}
)
select * from dq_check 
where null_check_status ='FAIL'