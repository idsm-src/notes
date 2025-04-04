# run in the server/loader directory

mvn exec:exec@mona-download
mvn exec:exec@mona-dbinit
mvn exec:java@mona-load
