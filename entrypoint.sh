#!/bin/bash

CLI=/apim-cli-1.5.1/scripts/apim.sh

echo "Run APIM-CLI with arguments: $@"

printenv

$CLI

# Import all users
cd ${cliData}/Users || exit 99;
for userDirectory in `find . -mindepth 1 -type d`
do
    echo "Import user from config: $orgDirectory"
    $CLI user import -s ${APIM_CLI_STAGE} -c ${cliData}/Organizations/$orgDirectory/org-config.json
done

# Import all organizations
cd ${cliData}/Organizations || exit 99;
for orgDirectory in `find . -mindepth 1 -type d`
do
    echo "Import organization from config: $orgDirectory"
    $CLI org import -s ${APIM_CLI_STAGE} -c ${cliData}/Organizations/$orgDirectory/org-config.json
done

# Import all applications
cd ${cliData}/ClientApps || exit 99;
for appDirectory in `find . -mindepth 1 -type d`
do
    echo "Import applicaton from config directory: $appDirectory"
    $CLI app import -s ${APIM_CLI_STAGE} -c ${cliData}/ClientApps/$appDirectory/application-config.json
done

# Import all APIs
cd ${cliData}/APIs || exit 99;
for apiDirectory in `find . -mindepth 1 -type d`
do
    echo "Import API from config directory: $apiDirectory"
    $CLI api import -s ${APIM_CLI_STAGE} -c ${cliData}/APIs/$apiDirectory/api-config.json -force
done

exit