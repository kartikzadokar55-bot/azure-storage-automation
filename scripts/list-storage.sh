#!/bin/bash

set -e

STORAGE_ACCOUNT="stazstorageauto01"
CONTAINER_NAME="project-data"

echo "======================================"
echo  "Azure Storage Listing"
echo "======================================"


echo "[INFO] Blobs in container : '$CONTAINER_NAME' "
echo

az storage blob list \
	--account-name "$STORAGE_ACCOUNT" \
	--container-name "$CONTAINER_NAME" \
	--auth-mode login \
	--output table

echo
echo  "[OK] Storage listing completed. "

