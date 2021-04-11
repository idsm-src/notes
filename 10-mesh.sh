# run in the loader directory

cat sql/mesh/schema.sql | psql -b -U idsm -d idsm 2>&1 | tee mesh-schema.log

java -Xmx256g -classpath bin:$(echo $(ls -1 lib/*) | sed 's| |:|g') cz.iocb.load.mesh.Mesh 2>&1 | tee mesh-load.log

cat sql/mesh/settings.sql | psql -b -U idsm -d idsm 2>&1 | tee mesh-settings.log

cat sql/mesh/foreignkey.sql | psql -b -U idsm -d idsm 2>&1 | tee mesh-foreignkey.log
