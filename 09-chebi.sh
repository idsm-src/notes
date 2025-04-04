# run in the server/loader directory

mvn exec:exec@chebi-download
mvn exec:exec@chebi-dbinit
mvn exec:java@chebi-load
