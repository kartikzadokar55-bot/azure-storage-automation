#!/bin/bash

set -e

RESOURCE_GROUP="rg-azure-storage-automation"
STORAGE_ACCOUNT="stazstorageauto01"
CONTAINER_NAME="project-data"

BLOB_NAME="sample.txt"
DOWNLOAD_DIR="downloaded-data"
DOWNLOAD_FILE="$DOWNLOADED_DIR/sample.txt"



echo "======================================"
echo "Azure Storage Download"
echo "======================================"


mkdir -p "$DOWNLOAD_DIR"

echo "[INFO] Downloading '$BLOB_NAME'... "


az storage blob download \
	--account-name "$STORAGE_ACCOUNT" \
	--container-name "$CONTAINER_NAME" \
	--name "$BLOB" \
	--file "$DOWNLOAD_FILE" \
	--auth-mode login \
	--output none

echo "[OK] Saved to : '$DOWNLOAD_FILE'"
