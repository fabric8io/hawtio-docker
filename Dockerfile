FROM fabric8/tomcat-8.0

MAINTAINER fabric8@googlegroups.com

ENV HAWTIO_VERSION 1.4.24
ENV JOLOKIA_DISABLE true

RUN rm -rf /opt/tomcat/webapps/*; mkdir /opt/tomcat/webapps/ROOT; wget http://central.maven.org/maven2/io/hawt/hawtio-default/$HAWTIO_VERSION/hawtio-default-$HAWTIO_VERSION.war -qO /opt/tomcat/webapps/hawtio.war
ADD index.html /opt/tomcat/webapps/ROOT/index.html

CMD /opt/tomcat/bin/catalina.sh run

