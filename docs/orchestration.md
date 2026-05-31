# Pipeline Orchestration

In a production environment, I would use Dataform to orchestrate the Bronze, Silver, and Gold layer transformations. Dataform integrates well with GitHub, which allows transformation logic to be version controlled and managed through a standard development workflow. Once new data has been loaded into the Bronze layer, a Dataform workflow could be triggered to run the Silver layer transformation and apply the required data quality and cleansing rules.

After the Silver layer has been successfully built, the workflow would continue by training the BigQuery ML K-Means model and then generating predictions using ML.PREDICT to create the final analytics_customer_segments table in the Gold layer. Dataform's dependency management and lineage capabilities help ensure that each step runs in the correct order while providing visibility into how data moves through the pipeline.
