#!/bin/bash

echo "Installing autocompletion with Gcloud"
. /usr/local/gcloud/google-cloud-sdk/completion.bash.inc

echo "Installing pre-commit hooks"
/usr/local/bin/pre-commit install -f --install-hooks