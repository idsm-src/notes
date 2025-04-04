# run in the server/loader directory

mvn exec:exec@mesh-download
mvn exec:exec@mesh-dbinit
mvn exec:java@mesh-load
