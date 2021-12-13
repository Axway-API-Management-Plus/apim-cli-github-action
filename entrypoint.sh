#!/bin/bash

CLI=/apim-cli-1.5.1/scripts/apim.sh

apimCLIArgs="-h ${INPUT_APIMHOSTNAME} -u ${INPUT_APIMUSERNAME} -p ${INPUT_APIMPASSWORD} ${INPUT_APIMEXTRAARGS}"

# Import all users
if ! [ -z ${INPUT_USERDIRECTORY} ];then
    echo "Importing users from directory: '${INPUT_USERDIRECTORY}'"
    cd ${INPUT_USERDIRECTORY} || exit 99;
    echo "Import all Users from the following directories containing a file user-config.json:"
    ls -1
    for userDirectory in `find . -mindepth 1 -type d`
    do
        $CLI user import ${apimCLIArgs} -c ${userDirectory}/user-config.json
    done
fi

# Import all organizations
if ! [ -z ${INPUT_ORGDIRECTORY} ];then
    echo "Importing organizations from directory: '${INPUT_ORGDIRECTORY}'"
    cd ${INPUT_ORGDIRECTORY} || exit 99;
    echo "Import all Organization from the following directories containing a file org-config.json:"
    ls -1
    for orgDirectory in `find . -mindepth 1 -type d`
    do
        $CLI org import ${apimCLIArgs} -c ${orgDirectory}/org-config.json
    done
fi

# Import all applications
if ! [ -z ${INPUT_APPDIRECTORY} ];then
    echo "Importing applications from directory: '${INPUT_APPDIRECTORY}'"
    cd ${INPUT_APPDIRECTORY} || exit 99;
    echo "Import all Applications from the following directories containing a file application-config.json:"
    ls -1
    for appDirectory in `find . -mindepth 1 -type d`
    do
        $CLI app import ${apimCLIArgs} -c ${appDirectory}/application-config.json
    done
fi

# Import all APIs
if ! [ -z ${INPUT_APIDIRECTORY} ];then
    echo "Importing APIs from directory: '${INPUT_APIDIRECTORY}'"
    cd ${INPUT_APIDIRECTORY} || exit 99;
    echo "Import all APIs from the following directories containing a file api-config.json:"
    ls -1
    for apiDirectory in `find . -mindepth 1 -type d`
    do
        $CLI api import ${apimCLIArgs} -c ${apiDirectory}/api-config.json -force
    done
fi

exit