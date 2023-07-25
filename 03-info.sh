# run in the loader directory

cat sql/info/base.sql | psql -b -U idsm -d idsm 2>&1 | tee info-base.log

cat sql/info/schema.sql | psql -b -U idsm -d idsm 2>&1 | tee info-schema.log

cat sql/info/settings.sql | psql -b -U idsm -d idsm 2>&1 | tee info-settings.log
