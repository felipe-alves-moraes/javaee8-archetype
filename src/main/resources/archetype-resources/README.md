#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
# Build
mvn clean package && docker build -f ./docker/Dockerfile -t ${groupId}/${artifactId} .

# RUN

docker rm -f ${artifactId} || true && docker run --env-file=./docker/local_env_properties -d -p 8080:8080 -p 4848:4848 --name ${artifactId} ${groupId}/${artifactId}