#!/bin/bash

CLI=/apim-cli-1.5.1/scripts/apim.sh

echo "Run APIM-CLI with arguments: $@"

printenv

$CLI

# Import all users
if ! [ -z ${INPUT_USERDIRECTORY} ];then
    echo "Importing users from directory: '${INPUT_USERDIRECTORY}'"
    cd ${INPUT_USERDIRECTORY} || exit 99;
    for userDirectory in `find . -mindepth 1 -type d`
    do
        echo "Import user from config: $userDirectory"
        $CLI user import -s ${APIM_CLI_STAGE} -c ${userDirectory}/user-config.json
    done
fi

# Import all organizations
if ! [ -z ${INPUT_ORGDIRECTORY} ];then
    echo "Importing organizations from directory: '${INPUT_ORGDIRECTORY}'"
    cd ${INPUT_ORGDIRECTORY} || exit 99;
    for orgDirectory in `find . -mindepth 1 -type d`
    do
        echo "Import organization from config: $orgDirectory"
        $CLI org import -s ${APIM_CLI_STAGE} -c ${orgDirectory}/org-config.json
    done
fi

# Import all applications
if ! [ -z ${INPUT_APPDIRECTORY} ];then
    echo "Importing applications from directory: '${INPUT_APPDIRECTORY}'"
    cd ${INPUT_APPDIRECTORY} || exit 99;
    for appDirectory in `find . -mindepth 1 -type d`
    do
        echo "Import applicaton from config directory: $appDirectory"
        $CLI app import -s ${APIM_CLI_STAGE} -c ${appDirectory}/application-config.json
    done
fi

# Import all APIs
if ! [ -z ${INPUT_APIDIRECTORY} ];then
    echo "Importing APIs from directory: '${INPUT_APIDIRECTORY}'"
    cd ${INPUT_APIDIRECTORY} || exit 99;
    for apiDirectory in `find . -mindepth 1 -type d`
    do
        echo "Import API from config directory: $apiDirectory"
        $CLI api import -s ${APIM_CLI_STAGE} -c ${apiDirectory}/api-config.json -force
    done
fi

exit