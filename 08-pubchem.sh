# run in the loader directory

bin/download-pubchem.sh data/pubchem

cat sql/pubchem/base.sql | psql -b -U idsm -d idsm 2>&1 | tee pubchem-base.log

cat sql/pubchem/schema/*.sql | psql -b -U idsm -d idsm 2>&1 | tee pubchem-schema.log

java -Xmx1024g -Djava.util.concurrent.ForkJoinPool.common.parallelism=32 -classpath 'classes:lib/*' cz.iocb.load.pubchem.PubChemRDF 2>&1 | tee pubchem-load.log

cat sql/pubchem/settings/*.sql | psql -b -U idsm -d idsm 2>&1 | tee pubchem-settings.log

cat sql/pubchem/functions/*.sql | psql -b -U idsm -d idsm 2>&1 | tee pubchem-functions.log

cat sql/pubchem/procedures/*.sql | psql -b -U idsm -d idsm 2>&1 | tee pubchem-procedures.log

cat sql/pubchem/foreignkey.sql | psql -b -U idsm -d idsm 2>&1 | tee pubchem-foreignkey.log
