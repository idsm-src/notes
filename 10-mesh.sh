# run in the loader directory

wget -P data/mesh ftp://ftp.nlm.nih.gov/online/mesh/rdf/mesh.nt

cat sql/mesh/base.sql | psql -b -U idsm -d idsm 2>&1 | tee mesh-base.log

cat sql/mesh/schema.sql | psql -b -U idsm -d idsm 2>&1 | tee mesh-schema.log

java -Xmx256g -classpath 'classes:lib/*' cz.iocb.load.mesh.Mesh 2>&1 | tee mesh-load.log

cat sql/mesh/settings.sql | psql -b -U idsm -d idsm 2>&1 | tee mesh-settings.log

cat sql/mesh/foreignkey.sql | psql -b -U idsm -d idsm 2>&1 | tee mesh-foreignkey.log
