# run in the loader directory

cat sql/ontology/schema/*.sql | psql -b -U idsm -d idsm 2>&1 | tee ontology-schema.log

java -Xmx256g -classpath bin:$(echo $(ls -1 lib/*) | sed 's| |:|g') cz.iocb.load.ontology.Ontology 2>&1 | tee ontology-load.log

cat sql/ontology/settings/*.sql | psql -b -U idsm -d idsm 2>&1 | tee ontology-settings.log

cat sql/ontology/functions/*.sql | psql -b -U idsm -d idsm 2>&1 | tee ontology-functions.log

cat sql/ontology/foreignkey.sql | psql -b -U idsm -d idsm 2>&1 | tee ontology-foreignkey.log
