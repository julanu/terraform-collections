#!/bin/bash

# Required inputs
CLIENT_ID="$1"
CLIENT_SECRET="$2"
TENANT_ID="$3"
SUBSCRIPTION_ID="$4"

# Validate inputs
if [[ -z "$CLIENT_ID" || -z "$CLIENT_SECRET" || -z "$TENANT_ID" || -z "$SUBSCRIPTION_ID" ]]; then
  echo "Usage: ./azure-login.sh <client-id> <client-secret> <tenant-id> <subscription-id>"
  exit 1
fi

# Perform service principal login
az login --service-principal \
  --username "$CLIENT_ID" \
  --password "$CLIENT_SECRET" \
  --tenant "$TENANT_ID" \
  --output none

# Set the target subscription
az account set --subscription "$SUBSCRIPTION_ID"
echo "✅ Logged into Azure and set subscription $SUBSCRIPTION_ID"
