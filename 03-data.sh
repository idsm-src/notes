# run in the data directory


# ChEBI
wget -P chebi ftp://ftp.ebi.ac.uk/pub/databases/chebi/ontology/chebi.owl


# ChEML
wget -P chembl ftp://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/latest/chembl_28_postgresql.tar.gz
wget -r -A ttl.gz -P chembl/rdf -nH --cut-dirs=5 ftp://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBL-RDF/28.0/
tar xz -f chembl/chembl_29_postgresql.tar.gz --to-stdout chembl_29_postgresql/chembl_29_postgresql.dmp | pg_restore --no-owner --no-comments -f - -t assays | grep "^[0-9].*CHEMBL" | cut -d $'\t' -f 1,19 > chembl/assay-mapping.txt


# pubchem
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/compound/general
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/substance
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/descriptor
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/synonym
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/inchikey
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/bioassay
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/measuregroup
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/endpoint
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/protein
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/pathway
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/conserveddomain
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/gene
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/source
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/concept
wget -r -A ttl.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/reference
wget -r -A ttl    -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/RDF/void.ttl
wget -r -A zip    -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/Bioassay/XML
wget -r -A sdf.gz -nH ftp://ftp.ncbi.nlm.nih.gov/pubchem/Compound/CURRENT-Full/SDF


# MeSH
wget -P mesh ftp://ftp.nlm.nih.gov/online/mesh/rdf/mesh.nt


# ontologies
wget -P ontology https://rdf.ncbi.nlm.nih.gov/pubchem/vocabulary.owl
wget -P ontology ftp://ftp.nlm.nih.gov/online/mesh/rdf/vocabulary_1.0.0.ttl
wget -P ontology http://www.bioassayontology.org/bao/bao_complete.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_core.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_module_vocabularies.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_module_biology.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_module_properties.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_assay.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_assaykit.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_computational.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_detection.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_format.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_instrument.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_materialentity.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_method.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_organization.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_people.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_phenotype.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_quality.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_result.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_role.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_screenedentity.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_software.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_unit.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_external.owl
wget -P ontology http://purl.obolibrary.org/obo/pr.owl
wget -P ontology http://purl.obolibrary.org/obo/go.owl
wget -P ontology http://www.geneontology.org/formats/oboInOwl.owl
wget -P ontology http://purl.obolibrary.org/obo/so.owl
wget -P ontology http://www.biopax.org/release/biopax-level3.owl
wget -P ontology https://raw.githubusercontent.com/CLO-ontology/CLO/master/src/ontology/clo.owl
wget -P ontology http://purl.obolibrary.org/obo/cl.owl
wget -P ontology http://purl.obolibrary.org/obo/doid.owl
wget -P ontology http://purl.obolibrary.org/obo/symp.owl
wget -P ontology http://purl.obolibrary.org/obo/trans.owl
wget -P ontology http://purl.obolibrary.org/obo/hp.owl
wget -P ontology http://purl.obolibrary.org/obo/pato.owl
wget -P ontology http://rdf.wwpdb.org/schema/pdbx-v50.owl
wget -P ontology http://purl.obolibrary.org/obo/uo.owl
wget -P ontology http://qudt.org/2.1/schema/qudt.ttl
wget -P ontology http://qudt.org/2.1/vocab/unit.ttl
wget -P ontology http://qudt.org/2.1/vocab/prefix.ttl
wget -P ontology http://qudt.org/2.1/vocab/quantitykind.ttl
wget -P ontology http://qudt.org/2.1/vocab/sou.ttl
wget -P ontology http://qudt.org/2.1/vocab/dimensionvector.ttl
wget -P ontology https://raw.githubusercontent.com/openphacts/jqudt/master/src/main/resources/onto/ops.ttl
wget -P ontology http://www.linkedmodel.org/schema/dtype.ttl
wget -P ontology http://www.linkedmodel.org/schema/vaem.ttl
wget -P ontology http://purl.obolibrary.org/obo/obi.owl
wget -P ontology http://semanticchemistry.github.io/semanticchemistry/ontology/cheminf.owl
wget -P ontology http://semanticchemistry.github.io/semanticchemistry/ontology/cdk.owl
wget -P ontology http://semanticchemistry.github.io/semanticchemistry/ontology/cheminf-algorithms.owl
wget -P ontology http://semanticchemistry.github.io/semanticchemistry/ontology/cheminf-core.owl
wget -P ontology http://semanticchemistry.github.io/semanticchemistry/ontology/cheminf-external.owl
wget -P ontology http://semanticscience.org/ontology/sio.owl
wget -P ontology http://purl.obolibrary.org/obo/iao.owl
wget -P ontology http://purl.obolibrary.org/obo/uberon.owl
wget -P ontology http://purl.obolibrary.org/obo/ncbitaxon.owl
wget -P ontology http://purl.obolibrary.org/obo/ncit.owl
wget -P ontology http://purl.obolibrary.org/obo/ro.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/annotations.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/core.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/el-constraints.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/generated-axioms.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/go-biotic.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/go_cc_import.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/go_mf_import.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/other_import.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/rohom.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/temporal-intervals.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/bfo-axioms.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/bfo-classes-minimal.owl
wget -P ontology https://raw.githubusercontent.com/BFO-ontology/BFO/master/releases/2014-05-03/owl-group/bfo.owl
wget -P ontology http://www.ebi.ac.uk/efo/efo.owl
wget -P ontology http://purl.obolibrary.org/obo/ero.owl
wget -P ontology http://purl.org/spar/cito.xml
wget -P ontology http://purl.org/spar/fabio.xml
wget -P ontology https://www.dublincore.org/specifications/dublin-core/dcmi-terms/dublin_core_terms.rdf
wget -P ontology http://www.w3.org/TR/skos-reference/skos.rdf
wget -P ontology http://purl.obolibrary.org/obo/foodon.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/deprecation_import.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/envo_import.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/foodon_product_import.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/gaz_import.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/geem_import.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/general_import.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/metadata_import.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/product_type_import.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/robot_organismal_materials.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/robot_pasta.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/robot_process_import.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/robot_wine.owl
wget -P ontology http://purl.obolibrary.org/obo/foodon/imports/siren_augment_codes.owl
wget -P ontology http://purl.obolibrary.org/obo/eco.owl
wget -P ontology http://purl.org/spar/frbr.xml
wget -P ontology https://raw.githubusercontent.com/ewilderj/doap/master/schema/doap.rdf
wget -P ontology http://xmlns.com/foaf/spec/index.rdf
wget -P ontology http://pav-ontology.github.io/pav/pav.rdf
wget -P ontology http://www.w3.org/2003/06/sw-vocab-status/ns.rdf
wget -P ontology http://vocab.deri.ie/void.rdf
wget -P ontology http://www.w3.org/2000/01/rdf-schema.rdf
wget -P ontology https://www.w3.org/1999/02/22-rdf-syntax-ns.rdf
wget -P ontology https://www.w3.org/2002/07/owl.rdf
wget https://data.bioontology.org/ontologies/NDF-RT/submissions/1/download?apikey=8b5b7825-538d-40e0-9e9e-5ab9274a9aeb -O ontology/NDF-RT.owl
wget https://evs.nci.nih.gov/ftp1/NCI_Thesaurus/Thesaurus.OWL.zip -O - | zcat > ontology/Thesaurus.owl

wget -P ontology https://bioinfo.uochb.cas.cz/gitlab/chemdb/notes/-/raw/develop/data/ontology/base.owl
wget -P ontology https://bioinfo.uochb.cas.cz/gitlab/chemdb/notes/-/raw/develop/data/ontology/pdbx-v40.owl
wget -P ontology https://bioinfo.uochb.cas.cz/gitlab/chemdb/notes/-/raw/develop/data/ontology/pubchem-missing.ttl
wget -P ontology https://bioinfo.uochb.cas.cz/gitlab/chemdb/notes/-/raw/develop/data/ontology/xsd.owl

cat chembl/rdf/cco.ttl.gz | gunzip > ontology/cco.ttl
cat chebi/chebi.owl | sed -n -e '1,/\/\/ Classes/'p -e '$a-->\n</rdf:RDF>' > ontology/chebi-base.owl
