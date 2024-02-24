#!/bin/bash
set -e

BASE=$(mktemp -d)
cd ${BASE}
mkdir -p {data/mona,config,query}
cp /opt/loaders/query/prefixes.sparql query/

cat > config/datasource.properties << EOF
url = jdbc:postgresql://localhost:5432/${POSTGRES_DB}
user = ${POSTGRES_USER}
password = ${POSTGRES_PASSWORD}
connectTimeout = 0
socketTimeout = 0
tcpKeepAlive = true
autoCommit = false
base = ${BASE}/data
EOF

if [ -z "$1" ]; then
  ID=$(wget https://mona.fiehnlab.ucdavis.edu/rest/downloads/predefined -O - 2>/dev/null | sed -r -n 's|.*"jsonExport":\{"id":"([a-z0-9-]+)","label":"All Spectra".*|\1|p')
else
  ID="$1"
fi

wget http://classyfire.wishartlab.com/system/downloads/1_0/chemont/ChemOnt_2_1.obo.zip -O data/mona/ChemOnt_2_1.obo.zip
wget "https://mona.fiehnlab.ucdavis.edu/rest/downloads/retrieve/$ID" -O data/mona/MoNA-export-All_Spectra-json.zip

java -Xms64g -classpath '/opt/loaders/classes:/opt/loaders/lib/*' cz.iocb.load.mona.MoNA

echo "done"
