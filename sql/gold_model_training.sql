create or replace model
`gemini-data-platform.retail_gold.customer_segment_model`
options(
    model_type = 'kmeans',
    num_clusters = 6
)
as

select
    amount,
    item_category
from `gemini-data-platform.retail_silver.cleaned_transactions`;
