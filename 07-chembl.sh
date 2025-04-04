# run in the server/loader directory

mvn exec:exec@chembl-download
mvn exec:exec@chembl-preload
mvn exec:exec@chembl-dbinit
mvn exec:java@chembl-load
