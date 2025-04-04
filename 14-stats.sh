# run in the server/loader directory

mvn exec:exec@stats-dbinit
mvn exec:java@stats-load
