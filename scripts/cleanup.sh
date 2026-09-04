#!/bin/bash

set -e

echo "======================================"
echo "Azure Storage Cleanup"
echo "======================================"


RESOURCE_GROUP="rg-azure-storage-automation"


if az group show --name "$RESOURCE_GROUP" &>/dev/null; then
	echo "[INFO] Resource Group Found : '$RESOURCE_GROUP'"
	echo "[INFO] Deleting Resource Group..."

	az group delete --resource-group "$RESOURCE_GROUP" --yes --no-wait
	echo "[OK] Resource group deletion started."

else
	echo "[ERROR] Resource Group does not exist."
fi

