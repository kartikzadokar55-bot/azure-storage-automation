#!/bin/bash

set -e


RESOURCE_GROUP="rg-azure-storage-automation"
STORAGE_ACCOUNT="stazstorageauto01"
CONTAINER_NAME="project-data"

FILE="sample-data/sample.txt"
BLOB_NAME="sample.txt"

echo "======================================"
echo "Azure Storage Upload"
echo "======================================"

if [ ! -f "$FILE"  ]; then
	echo "[ERROR] File does not exists : '$FILE'"
	exit 1
fi

echo "[INFO] Uploading '$FILE'..."


az storage blob upload \
	--account-name "$STORAGE_ACCOUNT" \
	--container-name "$CONTAINER_NAME" \
	--name "$BLOB_NAME" \
	--file "$FILE" \
	--auth-mode login \
	--overwrite True \
	--output none

echo "[OK] Blob uploaded successfully. "
