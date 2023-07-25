# run in the loader directory

bin/download-ontology.sh data/ontology

cat sql/ontology/base.sql | psql -b -U idsm -d idsm 2>&1 | tee ontology-base.log

cat sql/ontology/schema/*.sql | psql -b -U idsm -d idsm 2>&1 | tee ontology-schema.log

java -Xmx256g -classpath 'classes:lib/*' cz.iocb.load.ontology.Ontology 2>&1 | tee ontology-load.log

cat sql/ontology/settings/*.sql | psql -b -U idsm -d idsm 2>&1 | tee ontology-settings.log

cat sql/ontology/functions/*.sql | psql -b -U idsm -d idsm 2>&1 | tee ontology-functions.log

cat sql/ontology/foreignkey.sql | psql -b -U idsm -d idsm 2>&1 | tee ontology-foreignkey.log
