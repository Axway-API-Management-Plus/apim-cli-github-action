FROM adoptopenjdk/openjdk11:debianslim-jre

# Get APIM-CLI release package
ADD https://github.com/Axway-API-Management-Plus/apim-cli/releases/download/apimcli-1.5.1/axway-apimcli-1.5.1.tar.gz /

# Extract the release package
RUN tar xvfz axway-apimcli-1.5.1.tar.gz

# Add the entrypoint script
COPY entrypoint.sh /entrypoint.sh
 
# file to execute when the docker container starts up
ENTRYPOINT ["/entrypoint.sh"]
