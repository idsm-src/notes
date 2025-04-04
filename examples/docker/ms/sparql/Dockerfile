FROM docker.io/library/tomcat:9.0

RUN apt update
RUN apt install -y git maven

WORKDIR /root

RUN git clone https://github.com/idsm-src/sparql.git
RUN git clone https://github.com/idsm-src/server.git

COPY context.xml /root/server/service/src/main/webapp/META-INF/
COPY web.xml /root/server/service/src/main/webapp/WEB-INF/
COPY MSConfiguration.java /root/server/config/src/main/java/cz/iocb/chemweb/server/sparql/config/

RUN cd sparql && mvn install -Dmaven.test.skip=true
RUN cd server && mvn package -pl '!loaders'

RUN cp server/service/target/service-0.9.0-SNAPSHOT.war /usr/local/tomcat/webapps/sparql.war
