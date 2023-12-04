psql -U postgres -d postgres << 'EOF'
alter system set max_connections = '300';
alter system set shared_buffers = '512GB';
alter system set effective_cache_size = '1536GB';
alter system set maintenance_work_mem = '2GB';
alter system set checkpoint_completion_target = '0.9';
alter system set wal_buffers = '16MB';
alter system set default_statistics_target = '500';
alter system set random_page_cost = '1.1';
alter system set effective_io_concurrency = '200';
alter system set work_mem = '1GB';
alter system set min_wal_size = '4GB';
alter system set max_wal_size = '32GB';
alter system set max_worker_processes = '128';
alter system set max_parallel_workers_per_gather = '64';
alter system set max_parallel_workers = '128';
alter system set max_parallel_maintenance_workers = '64';
EOF


psql -U postgres -d postgres << 'EOF'
create role sparql with login;
\password sparql

create role idsm with login;
\password idsm
create database idsm owner idsm;
EOF


psql -U idsm -d idsm << 'EOF'
create schema trgm;
create schema uuid;
create schema pgcrypto;
create schema sparql;
create schema sachem;

grant usage on schema trgm to sparql;
grant usage on schema uuid to sparql;
grant usage on schema pgcrypto to sparql;
grant usage on schema sparql to sparql;
grant usage on schema sachem to sparql;
EOF

psql -U postgres -d idsm << 'EOF'
create extension "pg_trgm" with schema trgm;
create extension "uuid-ossp" with schema uuid;
create extension "pgcrypto" with schema pgcrypto;
create extension "pgsparql";
create extension "sachem";
EOF
