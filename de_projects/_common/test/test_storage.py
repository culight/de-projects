import pytest
from unittest.mock import Mock, patch
from ..storage import StorageClient

TEST_BUCKET = 'gs://gcppractice_scratch_data/_temp'

@patch('storage_client.storage')
def test_upload_blob(mock_storage):
    mock_bucket = Mock()
    mock_storage.Client().get_bucket.return_value = mock_bucket

    client = StorageClient('my-bucket')
    client.upload_blob('local/path/to/file.txt', 'file.txt')

    mock_bucket.blob.assert_called_with('file.txt')
    mock_bucket.blob().upload_from_filename.assert_called_with('local/path/to/file.txt')

@patch('storage_client.storage')
def test_download_blob(mock_storage):
    mock_bucket = Mock()
    mock_storage.Client().get_bucket.return_value = mock_bucket

    client = StorageClient('my-bucket')
    client.download_blob('file.txt', 'local/path/to/downloaded/file.txt')

    mock_bucket.blob.assert_called_with('file.txt')
    mock_bucket.blob().download_to_filename.assert_called_with('local/path/to/downloaded/file.txt')