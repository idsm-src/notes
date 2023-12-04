# run in the loader directory

wget -P data/chebi ftp://ftp.ebi.ac.uk/pub/databases/chebi/ontology/chebi.owl

cat sql/chebi/base.sql | psql -b -U idsm -d idsm 2>&1 | tee chebi-base.log

cat sql/chebi/schema.sql | psql -b -U idsm -d idsm 2>&1 | tee chebi-schema.log

java -Xmx256g -classpath 'classes:lib/*' cz.iocb.load.chebi.ChEBI 2>&1 | tee chebi-load.log

cat sql/chebi/settings.sql | psql -b -U idsm -d idsm 2>&1 | tee chebi-settings.log

cat sql/chebi/foreignkey.sql | psql -b -U idsm -d idsm 2>&1 | tee chebi-foreignkey.log
