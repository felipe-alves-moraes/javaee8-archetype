#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
FROM payara/micro:5.182

ADD ./target/libs /opt/libs

COPY ./target/${artifactId}.war ${DEPLOY_DIR}

ENTRYPOINT ["java", "-jar", "/opt/payara/payara-micro.jar", \
"--addLibs", "/opt/libs/", \
"--deploy", "/opt/payara/deployments/${artifactId}.war"]
