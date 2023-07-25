# run in the loader directory

cat sql/constraints/base.sql | psql -b -U idsm -d idsm 2>&1 | tee constraints-base.log

cat sql/constraints/schema.sql | psql -b -U idsm -d idsm 2>&1 | tee constraints-schema.log

java -Xmx256g -classpath 'classes:../chemweb/war/WEB-INF/classes:lib/*' cz.iocb.load.constraints.ConstraintGenerator 2>&1 | tee constraints-load.log

cat sql/constraints/settings.sql | psql -b -U idsm -d idsm 2>&1 | tee constraints-settings.log
