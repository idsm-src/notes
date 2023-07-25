# run in the loader directory

TABLES="\
-t activities \
-t assays \
-t assay_type \
-t binding_sites \
-t bio_component_sequences \
-t biotherapeutic_components \
-t biotherapeutics \
-t cell_dictionary \
-t component_class \
-t component_sequences \
-t component_synonyms \
-t compound_properties \
-t compound_records \
-t compound_structures \
-t confidence_score_lookup \
-t docs \
-t drug_indication \
-t drug_mechanism \
-t frac_classification \
-t hrac_classification \
-t irac_classification \
-t molecule_atc_classification \
-t molecule_dictionary \
-t molecule_frac_classification \
-t molecule_hierarchy \
-t molecule_hrac_classification \
-t molecule_irac_classification \
-t molecule_references \
-t molecule_synonyms \
-t protein_classification \
-t relationship_type \
-t source \
-t target_components \
-t target_dictionary \
-t target_relations";


bin/download-chembl.sh data/chembl

cat sql/chembl/base.sql | psql -b -U idsm -d idsm 2>&1 | tee chembl-base.log

tar xz -f data/chembl/chembl_*_postgresql.tar.gz --to-stdout --wildcards 'chembl_*_postgresql.dmp' | pg_restore --no-owner --no-comments -f - $TABLES | sed -e '1,/-- Data for Name:/s#public#chembl_tmp#g' -e 's#^COPY public\.#COPY chembl_tmp.#' | psql -a -U idsm -d idsm -v ON_ERROR_STOP=1 2>&1 | tee chembl-load.log

cat sql/chembl/schema/*.sql | psql -b -U idsm -d idsm 2>&1 | tee chembl-schema.log

java -Xmx256g -classpath 'classes:lib/*' cz.iocb.load.chembl.ChEMBL 2>&1 | tee chembl-load-additional.log

cat sql/chembl/settings/*.sql | psql -b -U idsm -d idsm 2>&1 | tee chembl-settings.log

cat sql/chembl/functions/*.sql | psql -b -U idsm -d idsm 2>&1 | tee chembl-functions.log

cat sql/chembl/foreignkey.sql | psql -b -U idsm -d idsm 2>&1 | tee chembl-foreignkey.log
