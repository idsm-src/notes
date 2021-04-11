# run in the loader directory

cat sql/constraints/schema.sql | psql -b -U idsm -d idsm 2>&1 | tee constraints-schema.log

java -Xmx256g -classpath bin:../chemweb/war/WEB-INF/classes:$(echo $(ls -1 lib/*) | sed 's| |:|g'): cz.iocb.load.constraints.ConstraintGenerator 2>&1 | tee constraints-load.log

cat sql/constraints/settings.sql | psql -b -U idsm -d idsm 2>&1 | tee constraints-settings.log
