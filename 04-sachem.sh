# run in the server/loader directory

mvn exec:exec@sachem-dbinit
mvn exec:java@sachem-load-drugbank
mvn exec:java@sachem-load-chebi
mvn exec:java@sachem-load-chembl
mvn exec:java@sachem-load-pubchem
