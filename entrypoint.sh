#!/bin/sh
printenv
cd /opt/apim-cli
java -Xms64m -Xmx256m -cp "lib/*" com.axway.apim.cli.APIManagerCLI ${INPUT_COMMAND}


