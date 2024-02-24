FROM docker.io/library/tomcat:9.0

RUN apt update
RUN apt install -y git ant

WORKDIR /root

RUN git clone https://github.com/idsm-src/chemweb.git

COPY build.xml /root/chemweb/
COPY context.xml /root/chemweb/war/META-INF/
COPY web.xml /root/chemweb/war/WEB-INF/
COPY MSConfiguration.java /root/chemweb/src/cz/iocb/chemweb/server/sparql/config/

RUN cd chemweb && ant && mv chemweb.war /usr/local/tomcat/webapps/sparql.war
