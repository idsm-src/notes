git clone https://github.com/idsm-src/sachem.git
git clone https://github.com/idsm-src/pgms.git
git clone https://github.com/idsm-src/pgsparql.git
git clone https://github.com/idsm-src/sparql.git
git clone https://github.com/idsm-src/server.git


# run in the sachem directory
autoreconf -i
./configure
make
sudo make install


# run in the pgms directory
autoreconf -i
./configure
make
sudo make install


# run in the pgsparql directory
autoreconf -i
./configure
make
sudo make install


# run in the sparql directory
mvn install


# run in the server directory
cp service/src/main/webapp/META-INF/context.tmpl.xml service/src/main/webapp/META-INF/context.xml
# set parameters in service/src/main/webapp/META-INF/context.xml
# set parameters in service/loaders/datasource.properties
mvn package -U
