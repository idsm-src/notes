FROM docker.io/library/postgres:16-alpine

COPY dbinit.sh /docker-entrypoint-initdb.d/dbinit.sh
COPY load-mona.sh /usr/bin
COPY load-isdb.sh /usr/bin

RUN apk add git build-base autoconf automake libtool pkgconf pcre2-dev apache-ant

WORKDIR /opt
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk

RUN git clone https://github.com/idsm-src/pgsparql.git
RUN git clone https://github.com/idsm-src/pgms.git
RUN git clone https://github.com/idsm-src/sachem.git
RUN git clone https://github.com/idsm-src/loaders.git

RUN cd pgsparql && autoreconf -i && CFLAGS="-O2 -Wall" ./configure && make install
RUN cd pgms && autoreconf -i && CFLAGS="-O2 -Wall" ./configure && make install
RUN cd sachem && autoreconf -i && CFLAGS="-O2 -Wall" ./configure && make install
RUN cd loaders && ant
