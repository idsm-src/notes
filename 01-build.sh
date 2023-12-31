git clone https://bioinfo.uochb.cas.cz/gitlab/chemdb/sachem.git
git clone https://bioinfo.uochb.cas.cz/gitlab/chemdb/pgsparql.git
git clone https://bioinfo.uochb.cas.cz/gitlab/chemdb/chemweb.git
git clone https://bioinfo.uochb.cas.cz/gitlab/chemdb/loaders.git

https://github.com/gwtproject/gwt/releases/download/2.10.0/gwt-2.10.0.zip
unzip gwt-2.10.0.zip


# run in the sachem directory
autoreconf -i
./configure
make
sudo make install


# run in the pgsparql directory
autoreconf -i
./configure
make
sudo make install


# run in the chemweb directory
cp create war/META-INF/context.tmpl.xml war/META-INF/context.xml # + set parameters
ant


# run in the loaders directory
cp config/datasource.tmpl.properties config/datasource.properties # + set parameters
ant
