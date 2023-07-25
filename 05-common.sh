# run in the loader directory

cat sql/common/base.sql | psql -b -U idsm -d idsm 2>&1 | tee common-base.log

cat sql/common/functions.sql | psql -b -U idsm -d idsm 2>&1 | tee common-functions.log
