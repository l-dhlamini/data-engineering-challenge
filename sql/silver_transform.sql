create or replace table gemini-data-platform.retail_silver.cleaned_transactions as 
  with clean_transactions as (
    select 
      transaction_id,
      customer_id,
      coalesce(safe_cast(nullif(signup_date, 'NULL') as date), purchase_date) as signup_date,
      purchase_date,
      amount,
      item_category,
      coalesce(safe_cast(nullif(is_returned, 'NULL') as bool), false) as is_returned,
    from `gemini-data-platform.retail_bronze.raw_transactions` 
    where amount > 0
  )

  select 
    *,
    date_diff(purchase_date, signup_date, day) as days_to_first_purchase 
  from clean_transactions;
