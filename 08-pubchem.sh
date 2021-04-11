# run in the loader directory

cat sql/pubchem/schema/*.sql | psql -b -U idsm -d idsm 2>&1 | tee pubchem-schema.log

java -Xmx512g -Djava.util.concurrent.ForkJoinPool.common.parallelism=32 -classpath bin:$(echo $(ls -1 lib/*) | sed 's| |:|g') cz.iocb.load.pubchem.PubChemRDF 2>&1 | tee pubchem-load.log

cat sql/pubchem/settings/*.sql | psql -b -U idsm -d idsm 2>&1 | tee pubchem-settings.log

cat sql/pubchem/functions/*.sql | psql -b -U idsm -d idsm 2>&1 | tee pubchem-functions.log

cat sql/pubchem/procedures/*.sql | psql -b -U idsm -d idsm 2>&1 | tee pubchem-procedures.log

cat sql/pubchem/foreignkey.sql | psql -b -U idsm -d idsm 2>&1 | tee pubchem-foreignkey.log
