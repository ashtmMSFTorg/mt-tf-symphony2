# Multi-tenant Deployments

## Setup

### Home tenant
Deployments can only be made across tenant boundaries with an application which has been registered with a multi-tenant audience.

Create a new app registration in Entra ID; provide any name you like, and when asked about the audience or supported account types, select "Accounts in any organizational directory (Any Microsoft Entra ID tenant - Multitenant)".

Make a note of the applicationId (== clientId); you'll need this when configuring any tenants targeted for deployments.

### Destination tenant
Before the application has permission to do anything in the target tenant, you must first provision a service principal for it there and grant it the required access.

You can do this by logging into the target tenant with the AZ CLI and running the following bash script:

```bash
applicationId="__REPLACE_ME__"
subscriptionId="__REPLACE_ME__"

sp_oid=$(az ad sp create --id $applicationId | jq -r '.id')

az role assignment create --assignee-object-id $sp_oid --assignee-principal-type ServicePrincipal --role "Owner" --scope "/subscriptions/$subscriptionId"
```

If you need an environment in which to quickly run this, consider opening a Cloud Shell (bash) in the Azure Portal while logged into the tenant.
