from dagster import define_asset_job, AssetSelection

trips_by_week = AssetSelection.keys(["trips_by_week"])

weekly_update_job = define_asset_job(
    name="weekly_update_job",
    selection=trips_by_week,
)
