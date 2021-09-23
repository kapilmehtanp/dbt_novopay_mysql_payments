
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/


{{ config(
    materialized="table",
    schema="ms_source"
) }}

with es_transaction_audit as (
    select
        id,
        transaction_type,
        transaction_sub_type,
        novopay_reference_code,
        accounting_reference_code,
        client_reference_code,
        external_reference_code,
        partner_reference_code,
        additional_reference_code,
        stan,
        customer_identifier_type,
        customer_identifier_value,
        transaction_amount,
        transaction_charges,
        total_amount,
        intial_status,
        status,
        partner_status
        from ms_source.transaction_audit
)



select
    es_transaction_audit.id,
    transaction_audit_additional_data.novopay_reference_code,
    transaction_audit_additional_data.label,
    transaction_audit_additional_data.value,
        es_transaction_audit.transaction_type,
        es_transaction_audit.transaction_sub_type,
        es_transaction_audit.accounting_reference_code,
        es_transaction_audit.client_reference_code,
        es_transaction_audit.external_reference_code,
        es_transaction_audit.partner_reference_code,
        es_transaction_audit.additional_reference_code,
        es_transaction_audit.stan,
        es_transaction_audit.customer_identifier_type,
        es_transaction_audit.customer_identifier_value,
        es_transaction_audit.transaction_amount,
        es_transaction_audit.transaction_charges,
        es_transaction_audit.total_amount,
        es_transaction_audit.intial_status,
        es_transaction_audit.status,
        es_transaction_audit.partner_status

from dk_payments.transaction_audit_additional_data

left join es_transaction_audit  using (novopay_reference_code)