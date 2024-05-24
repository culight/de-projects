import os
from google.cloud import storage

GCP_AUTH_FILE = os.getenv('df', default='GOOGLE_APPLICATION_CREDENTIALS')

# ==============================================================================

class LocalStorageClient:
    def __init__(self):
        pass

class GCSClient:
    def __init__(self, project: str, credentials: str):
        self.client = storage.Client(
            project=project,
            credentials=credentials
        )
    
    def get_bucket(self, bucket_name: str):
        self.bucket = self.client.get_bucket(bucket_name)

    def upload_blob(self, bucket_name: str, source_file_name: str, destination_blob_name: str):
        """Uploads a file to the bucket."""
        bucket = self.get_bucket(bucket_name)
        blob = bucket.blob(destination_blob_name)
        blob.upload_from_filename(source_file_name)
        print(f"File {source_file_name} uploaded to {destination_blob_name}.")

    def download_blob(self, bucket_name: str, source_blob_name: str, destination_file_name: str):
        """Downloads a blob from the bucket."""
        bucket = self.get_bucket(bucket_name)
        blob = bucket.blob(source_blob_name)
        blob.download_to_filename(destination_file_name)
        print(f"Blob {source_blob_name} downloaded to {destination_file_name}.")

# class S3Client(StorageBase):
#     def __init__(self, bucket_name):
#         self.bucket_name = bucket_name

#     def upload_blob(self, source_file_name, destination_blob_name):
#         raise NotImplementedError

#     def download_blob(self, source_blob_name, destination_file_name):
#         raise NotImplementedError