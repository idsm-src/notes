#!/bin/bash
set -e

NPROC=`nproc`

psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" << EOF
create role sparql with login password 'sparqlopenpassword';

create schema trgm;
create schema uuid;
create schema pgcrypto;
create schema sparql;
create schema sachem;
create schema pgms;

grant usage on schema trgm to sparql;
grant usage on schema uuid to sparql;
grant usage on schema pgcrypto to sparql;
grant usage on schema sparql to sparql;
grant usage on schema sachem to sparql;
grant usage on schema pgms to sparql;

create extension "pg_trgm" with schema trgm;
create extension "uuid-ossp" with schema uuid;
create extension "pgcrypto" with schema pgcrypto;
create extension "pgsparql";
create extension "sachem";
create extension "pgms";

alter system set max_connections = '20';
alter system set shared_buffers = '16GB';
alter system set effective_cache_size = '48GB';
alter system set maintenance_work_mem = '2GB';
alter system set wal_buffers = '16MB';
alter system set default_statistics_target = '500';
alter system set work_mem = '1GB';
alter system set min_wal_size = '4GB';
alter system set max_wal_size = '4GB';
alter system set max_worker_processes = '$NPROC';
alter system set max_parallel_workers_per_gather = '$NPROC';
alter system set max_parallel_workers = '$NPROC';
alter system set max_parallel_maintenance_workers = '$NPROC';
EOF


psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/sachem/procedures.sql

psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/ontology/base.sql
psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/ontology/schema.sql
psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/ontology/settings.sql
psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/ontology/functions.sql
psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/ontology/foreignkey.sql

psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/mona/base.sql
psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/mona/schema.sql
psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/mona/settings.sql
psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/mona/foreignkey.sql
psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/mona/sachem.sql

psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/isdb/base.sql
psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/isdb/schema.sql
psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/isdb/settings.sql
psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/isdb/foreignkey.sql
psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /opt/loaders/sql/isdb/sachem.sql


psql --echo-all --set ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" << 'EOF'
select sachem.sync_data('mona');
select sachem.sync_data('isdb');

create function sachem.substructure_search_all(varchar, sachem.search_mode = 'SUBSTRUCTURE', sachem.charge_mode = 'DEFAULT_AS_ANY', sachem.isotope_mode = 'IGNORE', sachem.radical_mode = 'DEFAULT_AS_ANY', sachem.stereo_mode = 'IGNORE', sachem.aromaticity_mode = 'AUTO', sachem.tautomer_mode = 'IGNORE', varchar = 'UNSPECIFIED', numeric = -1, boolean = false, numeric = 0) returns table (score float8, mona integer, isdb integer) language sql as
$$
  select * from sachem.substructure_search_multi('{"mona","isdb"}'::varchar[], $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12) as (score float8, mona integer, isdb integer);
$$
immutable parallel safe strict;

create function sachem.similarity_search_all(varchar, float8 = 0.85, numeric = 1, sachem.aromaticity_mode = 'AUTO', sachem.tautomer_mode = 'IGNORE', varchar = 'UNSPECIFIED', numeric = -1, boolean = false)returns table (score float8, mona integer, isdb integer) language sql as
$$
  select * from sachem.similarity_search_multi('{"mona","isdb"}'::varchar[], $1, $2, $3, $4, $5, $6, $7, $8) as (score float8, mona integer, isdb integer);
$$
immutable parallel safe strict;

create table mona.compound_pubchem_compounds(compound integer, cid integer);
grant select on mona.compound_pubchem_compounds to sparql;

create table isdb.compound_pubchem_compounds(compound integer, cid integer);
grant select on isdb.compound_pubchem_compounds to sparql;

create table isdb.compound_wikidata_compounds(compound integer, wikidata integer);
grant select on isdb.compound_wikidata_compounds to sparql;
EOF
