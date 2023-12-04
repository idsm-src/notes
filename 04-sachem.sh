psql -U idsm -d idsm << 'EOF'
create schema molecules;
grant usage on schema molecules to sparql;

create table molecules.drugbank (id int not null, molfile text not null, primary key(id));
select sachem.add_index('drugbank', 'molecules', 'drugbank', 'id', 'molfile', 4, 4, 250, 0);

create table molecules.chebi (id int not null, molfile text not null, primary key(id));
select sachem.add_index('chebi', 'molecules', 'chebi', 'id', 'molfile', 8, 8, 1000, 0);

create table molecules.chembl (id int not null, molfile text not null, primary key(id));
select sachem.add_index('chembl', 'molecules', 'chembl', 'id', 'molfile', 16, 16, 10000, 0);

create table molecules.pubchem (id int not null, molfile text not null, primary key(id));
select sachem.add_index('pubchem', 'molecules', 'pubchem', 'id', 'molfile', 64, 64, 100000, 0);

create table molecules.wikidata (id int not null, smiles text not null, primary key(id));
select sachem.add_index('wikidata', 'molecules', 'wikidata', 'id', 'smiles', 16, 16, 100000, 0);

grant select on table molecules.drugbank to sparql;
grant select on table molecules.chebi to sparql;
grant select on table molecules.chembl to sparql;
grant select on table molecules.pubchem to sparql;
grant select on table molecules.wikidata to sparql;

create function sachem.substructure_search_stub(varchar, varchar, sachem.search_mode = 'SUBSTRUCTURE', sachem.charge_mode = 'DEFAULT_AS_ANY', sachem.isotope_mode = 'IGNORE', sachem.radical_mode = 'DEFAULT_AS_ANY', sachem.stereo_mode = 'IGNORE', sachem.aromaticity_mode = 'AUTO', sachem.tautomer_mode = 'IGNORE', varchar = 'UNSPECIFIED', numeric = -1, boolean = false, numeric = 0) RETURNS TABLE (compound int, score float8) AS
$$
select compound, score::float8 from sachem.substructure_search($1, $2, $3, $4, $5, $6, $7, $8, $9, $11::int, $12, $13::int);
$$ LANGUAGE SQL IMMUTABLE STRICT;

create function sachem.similarity_search_stub(varchar, varchar, float8 = 0.85, numeric = 1, sachem.aromaticity_mode = 'AUTO', sachem.tautomer_mode = 'IGNORE', varchar = 'UNSPECIFIED', numeric = -1, boolean = false) RETURNS TABLE (compound int, score float8) AS
$$
select compound, score::float8 from sachem.similarity_search($1, $2, $3::float4, $4::int, $5, $6, $8::int, $9);
$$ LANGUAGE SQL IMMUTABLE STRICT;
EOF

java -classpath 'classes:lib/*' cz.iocb.load.sachem.DrugbankCompoundUpdater 2>&1 | tee sachem-drugbank-load.log
java -classpath 'classes:lib/*' cz.iocb.load.sachem.ChEBICompoundUpdater 2>&1 | tee sachem-chebi-load.log
java -classpath 'classes:lib/*' cz.iocb.load.sachem.ChEMBLCompoundUpdater 2>&1 | tee sachem-chembl-load.log
java -classpath 'classes:lib/*' cz.iocb.load.sachem.PubChemCompoundUpdater 2>&1 | tee sachem-pubchem-load.log

