# run in the server/loader directory

mvn exec:exec@ontology-download
mvn exec:exec@ontology-dbinit
mvn -Djdk.xml.entityExpansionLimit=0 exec:java@ontology-load
