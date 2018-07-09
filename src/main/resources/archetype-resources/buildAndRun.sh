#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
#!/bin/sh
ENV=$1

if [ -z "$ENV" ]
then
    ENV='local'
fi
ENV_FILE="$ENV"_"env_properties"

mvn clean package && docker build -f ./docker/Dockerfile -t ${groupId}/${artifactId} .
docker rm -f ${artifactId} || true && docker run --env-file=./docker/$ENV_FILE -d -p 8080:8080 -p 4848:4848 --name ${artifactId} ${groupId}/${artifactId}
