# run in the server/loader directory

mvn exec:exec@pubchem-download
mvn exec:exec@pubchem-dbinit
MAVEN_OPTS="-Xmx1024g" mvn exec:java@pubchem-load
