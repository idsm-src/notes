#!/bin/bash
set -e

cd /opt/server/loaders

mvn exec:exec@mona-download
MAVEN_OPTS="-Xmx32g" mvn exec:java@mona-load
