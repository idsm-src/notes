# run in the loader directory

cat sql/common/schema.sql | psql -b -U idsm -d idsm 2>&1 | tee common-schema.log

cat sql/common/settings.sql | psql -b -U idsm -d idsm 2>&1 | tee common-settings.log

cat sql/common/functions.sql | psql -b -U idsm -d idsm 2>&1 | tee common-functions.log
