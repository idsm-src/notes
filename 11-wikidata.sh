# run in the loader directory

cat sql/mesh/base.sql | psql -b -U idsm -d idsm 2>&1 | tee mesh-base.log

cat sql/mesh/schema.sql | psql -b -U idsm -d idsm 2>&1 | tee mesh-schema.log

java -classpath 'classes:lib/*' cz.iocb.load.sachem.WikidataCompoundUpdater2>&1 | tee sachem-wikidata-load.log

cat sql/mesh/settings.sql | psql -b -U idsm -d idsm 2>&1 | tee mesh-settings.log
