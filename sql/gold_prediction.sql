create or replace table
`gemini-data-platform.retail_gold.analytics_customer_segments`
as

select *
from ml.predict(
    model `gemini-data-platform.retail_gold.customer_segment_model`,
    (
        select *
        from `gemini-data-platform.retail_silver.cleaned_transactions`
    )
);
