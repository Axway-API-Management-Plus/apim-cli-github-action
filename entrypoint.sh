#!/bin/sh
java -Xms64m -Xmx256m -cp "/opt/apim-cli/lib/*" com.axway.apim.cli.APIManagerCLI ${INPUT_COMMAND}
