# run in the server/loader directory

mvn exec:exec@wikidata-dbinit
mvn exec:java@sachem-load-wikidata
