#!/usr/bin/env bash

# build.sh - one script to rule them all


# create file system
mkdir -p ./pages
mkdir -p ./tmp

# read the XML and output both SQL insert statements as well as wiki markup
echo "Step #1 of 4: Reading XML" >&2
./bin/xml2markup.pl > ./tmp/inserts.sql

# create the database and initialize it with identifiers and church names
echo "Step #2 of 4: Initializing database" >&2
./bin/db-initialize.sh
./bin/titles2db.sh

# read all pages, extract metadata, and update the database
echo "Step #3 of 4: Extracting and saving metadata" >&2
./bin/infobox2sql.sh
./bin/infobox2db.sh

# dump
echo "Step #4 of 4: Dumping database as CSV" >&2
./bin/db2csv.sh

# done
echo "Done" >&2
exit
