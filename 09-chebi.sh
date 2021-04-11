# run in the loader directory

cat sql/chebi/schema.sql | psql -b -U idsm -d idsm 2>&1 | tee chebi-schema.log

java -Xmx256g -classpath bin:$(echo $(ls -1 lib/*) | sed 's| |:|g') cz.iocb.load.chebi.ChEBI 2>&1 | tee chebi-load.log

cat sql/chebi/settings.sql | psql -b -U idsm -d idsm 2>&1 | tee chebi-settings.log

cat sql/chebi/foreignkey.sql | psql -b -U idsm -d idsm 2>&1 | tee chebi-foreignkey.log
