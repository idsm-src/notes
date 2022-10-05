# run in the data directory

# PubChem
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

# ChEML
wget -P chembl ftp://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBLdb/latest/chembl_31_postgresql.tar.gz
wget -r -A ttl.gz -P chembl/rdf -nH --cut-dirs=5 ftp://ftp.ebi.ac.uk/pub/databases/chembl/ChEMBL-RDF/31.0/

# ChEBI
wget -P chebi ftp://ftp.ebi.ac.uk/pub/databases/chebi/ontology/chebi.owl

# MeSH
wget -P mesh ftp://ftp.nlm.nih.gov/online/mesh/rdf/mesh.nt

# BioAssay Ontology (BAO)
wget -P ontology http://www.bioassayontology.org/bao/bao_complete.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_core.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_metadata.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_module_biology.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_module_properties.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_module_vocabularies.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_assaykit.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_assay.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_biology.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_computational.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_detection.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_format.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_function.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_instrument.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_materialentity.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_method.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_organization.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_people.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_phenotype.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_properties.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_ro.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_quality.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_result.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_role.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_screenedentity.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_software.owl
wget -P ontology http://www.bioassayontology.org/bao/bao_vocabulary_unit.owl

# Protein Ontology (PRO)
wget -P ontology http://purl.obolibrary.org/obo/pr.owl

# Gene Ontology (GO)
wget -P ontology http://purl.obolibrary.org/obo/go.owl

# Sequence Ontology (SO)
wget -P ontology http://purl.obolibrary.org/obo/so.owl

# Cell Line Ontology (CLO)
wget -P ontology http://purl.obolibrary.org/obo/clo.owl

# Cell Ontology (CL)
wget -P ontology http://purl.obolibrary.org/obo/cl.owl

# Disease Ontology (DO)
wget -P ontology http://purl.obolibrary.org/obo/doid.owl

# Symptom Ontology (SYMP)
wget -P ontology http://purl.obolibrary.org/obo/symp.owl

# Pathogen Transmission Ontology (TRANS)
wget -P ontology http://purl.obolibrary.org/obo/trans.owl

# The Human Phenotype Ontology (HP)
wget -P ontology http://purl.obolibrary.org/obo/hp.owl

# Phenotype And Trait Ontology (PATO)
wget -P ontology http://purl.obolibrary.org/obo/pato.owl

# Units of Measurement Ontology (UO)
wget -P ontology http://purl.obolibrary.org/obo/uo.owl

# Ontology for Biomedical Investigations (OBI)
wget -P ontology http://purl.obolibrary.org/obo/obi.owl

# Information Artifact Ontology (IAO)
wget -P ontology http://purl.obolibrary.org/obo/iao.owl

# Uber-anatomy Ontology (UBERON)
wget -P ontology http://purl.obolibrary.org/obo/uberon.owl

# NCBI Taxonomy Database
wget -P ontology http://purl.obolibrary.org/obo/ncbitaxon.owl

# National Center Institute Thesaurus (OBO Edition)
wget -P ontology http://purl.obolibrary.org/obo/ncit.owl

# OBO Relations Ontology
wget -P ontology http://purl.obolibrary.org/obo/ro.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/annotations.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/core.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/el-constraints.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/generated-axioms.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/rohom.owl
wget -P ontology http://purl.obolibrary.org/obo/ro/temporal-intervals.owl

# Basic Formal Ontology (BFO)
wget -P ontology http://purl.obolibrary.org/obo/bfo.owl

# Food Ontology (FOODON)
wget -P ontology http://purl.obolibrary.org/obo/foodon.owl

# Evidence & Conclusion Ontology (ECO)
wget -P ontology http://purl.obolibrary.org/obo/eco.owl

# Disease Drivers Ontology (DISDRIV)
wget -P ontology http://purl.obolibrary.org/obo/disdriv.owl

# Genotype Ontology (GENO)
wget -P ontology http://purl.obolibrary.org/obo/geno.owl

# Common Anatomy Reference Ontology (CARO)
wget -P ontology http://purl.obolibrary.org/obo/caro.owl

# Environment Ontology (ENVO)
wget -P ontology http://purl.obolibrary.org/obo/envo.owl

# Ontology for General Medical Science (OGMS)
wget -P ontology http://purl.obolibrary.org/obo/ogms.owl

# Unified phenotype ontology (uPheno)
wget -P ontology http://purl.obolibrary.org/obo/upheno/v2/upheno.owl

# OBO Metadata Ontology
wget -P ontology http://purl.obolibrary.org/obo/omo.owl

# Biological Pathway Exchange
wget -P ontology http://www.biopax.org/release/biopax-level3.owl

# PDBx ontology
wget -P ontology --no-check-certificate http://rdf.wwpdb.org/schema/pdbx-v50.owl
wget -P ontology https://bioinfo.uochb.cas.cz/gitlab/chemdb/notes/-/raw/develop/data/ontology/pdbx-v40.owl

# Quantities, Units, Dimensions and Types Ontology (QUDT)
wget -P ontology http://qudt.org/2.1/schema/qudt.ttl
wget -P ontology http://qudt.org/2.1/schema/datatype.ttl
wget -P ontology http://qudt.org/2.1/vocab/constant.ttl
wget -P ontology http://qudt.org/2.1/vocab/prefix.ttl
wget -P ontology http://qudt.org/2.1/vocab/dimensionvector.ttl
wget -P ontology http://qudt.org/2.1/vocab/quantitykind.ttl
wget -P ontology http://qudt.org/2.1/vocab/soqk.ttl
wget -P ontology http://qudt.org/2.1/vocab/sou.ttl
wget -P ontology http://qudt.org/2.1/vocab/unit.ttl

# Open PHACTS Units extending QUDT
wget -P ontology https://github.com/openphacts/jqudt/raw/master/src/main/resources/onto/ops.ttl

# Shapes Constraint Language (SHACL)
wget -P ontology https://www.w3.org/ns/shacl.rdf

# Linked Models: Datatype Ontology (DTYPE)
wget -P ontology http://www.linkedmodel.org/schema/dtype.ttl

# Linked Models: Vocabulary for Attaching Essential Metadata (VAEM)
wget -P ontology http://www.linkedmodel.org/schema/vaem.ttl

# Information Ontology (CHEMINF)
wget -P ontology http://semanticchemistry.github.io/semanticchemistry/ontology/cheminf.owl
wget -P ontology http://semanticchemistry.github.io/semanticchemistry/ontology/cdk.owl
wget -P ontology http://semanticchemistry.github.io/semanticchemistry/ontology/cheminf-algorithms.owl
wget -P ontology http://semanticchemistry.github.io/semanticchemistry/ontology/cheminf-core.owl
sed -i 's|&chebi;CHEBI_|\&obo;CHEBI_|g' ontology/cheminf.owl

# Semanticscience integrated ontology (SIO)
wget -P ontology http://semanticscience.org/ontology/sio.owl

# National Drug File-Reference Terminology (NDF-RT)
wget https://data.bioontology.org/ontologies/NDF-RT/submissions/1/download?apikey=8b5b7825-538d-40e0-9e9e-5ab9274a9aeb -O ontology/NDF-RT.owl

# National Center Institute Thesaurus (NCIt)
wget https://evs.nci.nih.gov/ftp1/NCI_Thesaurus/Thesaurus.OWL.zip -O - | zcat > ontology/Thesaurus.owl

# Experimental Factor Ontology (EFO)
wget -P ontology http://www.ebi.ac.uk/efo/efo.owl

# Eagle-i Resource Ontology (ERO)
wget -P ontology https://bioinfo.uochb.cas.cz/gitlab/chemdb/notes/-/raw/develop/data/ontology/ero.owl

# Citation Typing Ontology (CiTO)
wget -P ontology https://sparontologies.github.io/cito/current/cito.owl

# FRBR-aligned Bibliographic Ontology (FaBiO)
wget -P ontology https://sparontologies.github.io/fabio/current/fabio.owl

# Essential FRBR in OWL2 DL Ontology (FRBR)
wget -P ontology https://sparontologies.github.io/frbr/current/frbr.owl

# Dublin Core Metadata Initiative Terms (DCMI)
wget -P ontology https://www.dublincore.org/specifications/dublin-core/dcmi-terms/dublin_core_terms.rdf
wget -P ontology https://www.dublincore.org/specifications/dublin-core/dcmi-terms/dublin_core_type.rdf
wget -P ontology https://www.dublincore.org/specifications/dublin-core/dcmi-terms/dublin_core_abstract_model.rdf
wget -P ontology https://www.dublincore.org/specifications/dublin-core/dcmi-terms/dublin_core_elements.rdf

# Bibliographic Ontology (BIBO)
wget -P ontology https://www.dublincore.org/specifications/bibo/bibo/bibo.rdf.xml

# Simple Knowledge Organization System (SKOS)
wget -P ontology http://www.w3.org/TR/skos-reference/skos.rdf

# Description of a Project Vocabulary (DOAP)
wget -P ontology https://github.com/ewilderj/doap/raw/master/schema/doap.rdf

# FOAF Vocabulary
wget -P ontology http://xmlns.com/foaf/0.1/index.rdf

# Provenance, Authoring and Versioning (PAV)
wget -P ontology http://pav-ontology.github.io/pav/pav.rdf

# SemWeb Vocab Status Ontology
wget -P ontology http://www.w3.org/2003/06/sw-vocab-status/ns.rdf

# Vocabulary of Interlinked Datasets (VoID)
wget -P ontology http://vocab.deri.ie/void.ttl

# Situation Ontology
wget -P ontology http://www.ontologydesignpatterns.org/cp/owl/situation.owl
wget -P ontology http://www.ontologydesignpatterns.org/schemas/cpannotationschema.owl

# OWL 2 Schema (OWL 2)
wget -P ontology https://www.w3.org/2002/07/owl.rdf

# RDF Schema (RDFS)
wget -P ontology http://www.w3.org/2000/01/rdf-schema.rdf

# RDF Vocabulary Terms
wget -P ontology https://www.w3.org/1999/02/22-rdf-syntax-ns.rdf

# PubChem Ontology
wget -P ontology https://rdf.ncbi.nlm.nih.gov/pubchem/vocabulary.owl

# ChEMBL Ontology
cat chembl/rdf/cco.ttl.gz | gunzip > ontology/cco.ttl

# ChEBI Ontology
cat chebi/chebi.owl | sed -n -e '1,/\/\/ Classes/'p -e '$a-->\n</rdf:RDF>' > ontology/chebi-base.owl

# MeSH Ontology
wget -P ontology ftp://ftp.nlm.nih.gov/online/mesh/rdf/vocabulary_1.0.0.ttl

# OBO in OWL Meta-Ontology
wget -P ontology http://www.geneontology.org/formats/oboInOwl.owl

# other ontologies
wget -P ontology https://bioinfo.uochb.cas.cz/gitlab/chemdb/notes/-/raw/develop/data/ontology/base.owl
wget -P ontology https://bioinfo.uochb.cas.cz/gitlab/chemdb/notes/-/raw/develop/data/ontology/pubchem-missing.ttl
wget -P ontology https://bioinfo.uochb.cas.cz/gitlab/chemdb/notes/-/raw/develop/data/ontology/xsd.owl
