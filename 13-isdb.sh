# run in the loader directory

cat sql/isdb/base.sql | psql -b -U idsm -d idsm 2>&1 | tee isdb-base.log

cat sql/isdb/schema.sql | psql -b -U idsm -d idsm 2>&1 | tee isdb-schema.log

cat sql/isdb/load.sql | psql -b -U idsm -d idsm 2>&1 | tee isdb-load.log

cat sql/isdb/crosslinks.sql | psql -b -U idsm -d idsm 2>&1 | tee isdb-crosslinks.log

cat sql/isdb/settings.sql | psql -b -U idsm -d idsm 2>&1 | tee isdb-settings.log

cat sql/isdb/foreignkey.sql | psql -b -U idsm -d idsm 2>&1 | tee isdb-foreignkey.log

cat sql/isdb/sachem.sql | psql -b -U idsm -d idsm 2>&1 | tee isdb-sachem.log
