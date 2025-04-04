#!/bin/bash
set -e

cd /opt/server/loaders

mvn exec:exec@isdb-download
mvn exec:exec@isdb-load
