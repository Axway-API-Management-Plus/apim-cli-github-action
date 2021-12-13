#!/bin/bash

echo "Current directory"
pwd
echo "Listing"
ls -l

echo "Run APIM-CLI with arguments: $@"
./apim-cli-1.5.1/scripts/apim.sh "$@"
