# Azure Storage Automation Architecture

## Overview

The project uses Azure Storage resources managed through Azure CLI and Bash automation.

## Architecture

```text
                         Azure
                           |
                    Azure Subscription
                           |
                           v
                Resource Group
                           |
                           v
                  Storage Account
                           |
             +-------------+-------------+
             |                           |
             v                           v
       Blob Storage                 Azure Files
             |                           |
             v                           v
       project-data                shared-data
             |                           |
             v                           v
        sample.txt             file-share-test.txt

## Workflow

### Provisioning

```text

Bash Script
     |
     v
Azure CLI
     |
     v
Resource Group
     |
     v
Storage Account
     |
     v
Blob Container


### Blob Upload

```text

Local File
    |
    v
upload-data.sh
    |
    v
Azure CLI
    |
    v
Blob Container

### Blob Download

```text

Blob Container
    |
    v
download-data.sh
    |
    v
Azure CLI
    |
    v
Local File


### Resource Cleanup

```text
cleanup.sh
    |
    v
Azure CLI
    |
    v
Resource Group
    |
    v
Azure Resources



## Security

Blob data access is performed through Azure CLI authentication and Azure RBAC.

The project avoids hard-coding credentials into the Bash scripts.


## Design Principle

The provisioning script checks whether resources already exist before attempting to create them.

This allows the script to be safely executed again without unnecessarily recreating existing resources



