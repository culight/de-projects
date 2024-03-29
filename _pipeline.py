"""
CODE OWNERS: Demerrick Moton
OBJECTIVE: Master pipeline which will combine relevant jobs
DEVELOPER NOTES: 
"""

import logging

import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions

logging.basicConfig(format="%(asctime)s - %(message)s", level=logging.INFO)
LOGGER = logging.getLogger(__name__)

# ==============================================================================


def build_pipeline(argv):
    with beam.Pipeline(options=PipelineOptions(argv)) as pipeline:
        # Read in the data
        jobs_raw = pipeline | "Read CSV" >> beam.io.ReadFromText(
            "gs://dataflow-jobsearch-bucket/jobs/gcp/glassdoor_0-100.csv"
        )

        LOGGER.info(f"jobs_raw: {jobs_raw}")

        jobs_raw | "Write to BQ" >> beam.io.WriteToBigQuery(
            dataset="job_search",
            table="raw_jobs",
            project="gcp-practice-325719",
            schema=jobs_schema,
        )


if __name__ == "__main__":
    import sys

    build_pipeline(sys.argv[1:])
