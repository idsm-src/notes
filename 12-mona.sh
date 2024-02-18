# run in the loader directory

cat sql/mona/base.sql | psql -b -U idsm -d idsm 2>&1 | tee mona-base.log

cat sql/mona/schema.sql | psql -b -U idsm -d idsm 2>&1 | tee mona-schema.log

cat sql/mona/sachem.sql | psql -b -U idsm -d idsm 2>&1 | tee mona-sachem.log

java -Xmx128g -Djava.util.concurrent.ForkJoinPool.common.parallelism=32 -classpath 'classes:lib/*' cz.iocb.load.mona.MoNA 2>&1 | tee mona-load.log

cat sql/mona/crosslinks.sql | psql -b -U idsm -d idsm 2>&1 | tee mona-crosslinks.log

cat sql/mona/settings.sql | psql -b -U idsm -d idsm 2>&1 | tee mona-settings.log

cat sql/mona/foreignkey.sql | psql -b -U idsm -d idsm 2>&1 | tee mona-foreignkey.log
