FROM fabric8/tomcat-8.0

MAINTAINER fabric8@googlegroups.com

ENV HAWTIO_VERSION 1.4.26
ENV JOLOKIA_DISABLE true

# configuring what initial repository to configure on startup
#ENV hawtio_config_repo

# should we clone the remote repo on startup?
ENV hawtio_config_cloneOnStartup false

# which initial maven URLs (comma separated) should be imported into the default wiki
#ENV hawtio_config_importURLs

RUN rm -rf /opt/tomcat/webapps/*; mkdir /opt/tomcat/webapps/ROOT; wget http://central.maven.org/maven2/io/hawt/hawtio-default/$HAWTIO_VERSION/hawtio-default-$HAWTIO_VERSION.war -qO /opt/tomcat/webapps/hawtio.war
ADD index.html /opt/tomcat/webapps/ROOT/index.html

CMD /opt/tomcat/bin/catalina.sh run
