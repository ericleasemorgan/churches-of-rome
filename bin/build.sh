#!/usr/bin/env bash

# create file system
mkdir -p ./pages
mkdir -p ./tmp

# read the XML and output both SQL insert statements as well as wiki markup
echo "Step #1 of 3: Reading XML" >&2
./bin/xml2markup.pl > ./tmp/inserts.sql

# create the database and initialize it with identifiers and church names
echo "Step #2 of 3: Initializing database" >&2
./bin/db-initialize.sh
./bin/titles2db.sh

# read all pages, extract metadata, and update the database
echo "Step #3 of 3: Extracting and saving metadata" >&2
./bin/infobox2sql.sh
./bin/infobox2db.sh

# done
echo "Done" >&2
exit
