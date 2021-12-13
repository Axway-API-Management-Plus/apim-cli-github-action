FROM adoptopenjdk/openjdk11:debianslim-jre

ADD https://github.com/Axway-API-Management-Plus/apim-cli/releases/download/apimcli-1.5.0/axway-apimcli-1.5.0.tar.gz /

# Copies your code file  repository to the filesystem
COPY entrypoint.sh /entrypoint.sh
 
# change permission to execute the script and
RUN chmod +x /entrypoint.sh
 
# file to execute when the docker container starts up
ENTRYPOINT ["/entrypoint.sh"]
