#!/bin/bash

set -e


RESOURCE_GROUP="rg-azure-storage-automation"
STORAGE_ACCOUNT="stazstorageauto01"
LOCATION="centralindia"
CONTAINER_NAME="project-data"


echo "======================================"

echo "Azure Storage Automation"

echo "======================================"



#Resource Group Creation

if az group show --name "$RESOUCE_GROUP" &>/dev/null; then
	echo "[SKIP] Resource Group already exists."
else
	 echo "[CREATE] Creating Resource Group"

	az group create --name "$RESOURCE_GROUP" --location "$LOCATION" --output none

	echo "[OK] Resource group created."

fi

# Creating storage account

if az storage account show --name "$STORAGE_ACCOUNT" --resource-group "$RESOURCE_GROUP" &>/dev/null; then
	echo "[SKIP] Storage Account already exists."
else

	echo "[CREATE] Creating Storage account..."

	az storage account create --name "$STORAGE_ACCOUNT" --resource-group "$RESOURCE_GROUP" --location "$LOCATION" --sku Standard_LRS --kind StorageV2 --access-tier hot --output none

	echo "[OK] Storage account created."

fi

# Creating BLOB container


if az storage container show --name "$CONTAINER_NAME" --account-name "$STORAGE_ACCOUNT" --auth-mode login &>/dev/null; then
	echo "[SKIP] Container already exists."

else


	echo "[CREATE] Creating Blob container"

	az storage container create \
		--name "$CONTAINER_NAME" \
		--account-name "$STORAGE_ACCOUNT" \
		--auth-mode login \
		--output none

	echo "[OK]Blob Container created."

fi


echo "Azure Storage environment created successfully."

