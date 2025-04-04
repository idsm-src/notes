# run in the server/loader directory

mvn exec:exec@isdb-download
mvn exec:exec@isdb-dbinit
mvn exec:exec@isdb-load
