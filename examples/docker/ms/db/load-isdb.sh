#!/bin/bash
set -e

BASE=$(mktemp -d)
cd ${BASE}

wget https://zenodo.org/records/8287341/files/isdb_neg.mgf
wget https://zenodo.org/records/8287341/files/isdb_pos.mgf

psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/isdb/load.sql

echo "done"
