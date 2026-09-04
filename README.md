# Azure Storage Automation

A hands-on Azure Storage project using Azure CLI and Bash to provision and manage Azure Storage resources.

## Project Overview

This project demonstrates how to manage Azure Storage from the command line and automate common storage operations using Bash scripts.

The project covers:

- Azure Resource Group creation
- Azure Storage Account creation
- Azure Blob Container creation
- Blob upload
- Blob download
- Blob listing
- Azure File Share creation
- Bash automation
- Idempotent resource provisioning
- Azure resource cleanup

## Architecture

```
                     Azure Subscription
                            |
                            v
                    Resource Group
             rg-azure-storage-automation
                            |
                            v
                   Storage Account
                  stazstorageauto01
                            |
              +-------------+-------------+
              |                           |
              v                           v
        Blob Storage                 Azure Files
              |                           |
              v                           v
        project-data                 shared-data
              |                           |
              v                           v
         sample.txt             file-share-test.txt
```

## Technologies Used

- Microsoft Azure
- Azure Storage
- Azure CLI
- Bash
- Linux / WSL
- Git
- GitHub

## Project Structure

```text
azure-storage-automation/
|
├── README.md
|
├── docs/
│   └── architecture.md
|
├── sample-data/
│   ├── sample.txt
│   └── file-share-test.txt
|
└── scripts/
    ├── create-storage.sh
    ├── upload-data.sh
    ├── download-data.sh
    ├── list-storage.sh
    └── cleanup.sh
```

## Scripts

### create-storage.sh

Creates the Azure Storage environment:

- Resource Group
- Storage Account
- Blob Container

The script checks whether resources already exist before creating them.

### upload-data.sh

Uploads `sample-data/sample.txt` to the `project-data` Blob container.

### download-data.sh

Downloads `sample.txt` from Azure Blob Storage into the local `downloaded-data` directory.

### list-storage.sh

Lists the blobs available inside the `project-data` container.

### cleanup.sh

Deletes the project Resource Group and all resources contained within it.

> ⚠️ Do not run this script unless the Azure resources should be deleted.

## Authentication

Azure CLI is used to authenticate with Azure.

Blob Storage operations use Microsoft Entra authentication via `--auth-mode login`.

The project also demonstrates Azure RBAC for Blob data access using the **Storage Blob Data Contributor** role.

## Key Azure Concepts Practiced

**Resource Group**
A logical container for related Azure resources.

**Storage Account**
The Azure resource that provides storage services for the project.

**Blob Storage**
Used for object-based storage such as files and application data.

**Azure Files**
Provides managed file-share storage.

**Azure RBAC**
Controls access to Azure resources and storage data.

## Learning Outcomes

After completing this project, I can:

- Create Azure Storage resources using Azure CLI
- Manage Blob containers
- Upload and download Blob data
- List Blob objects
- Create Azure File Shares
- Automate Azure operations with Bash
- Build idempotent provisioning scripts
- Apply Azure RBAC concepts
- Manage the lifecycle of Azure resources

## Project Status

Completed core Azure Storage automation workflow.

## Future Improvements

Possible future enhancements:

- Parameterize scripts
- Add input validation
- Add logging
- Add better error handling
- Add Azure File Share automation
- Add CI/CD integration
