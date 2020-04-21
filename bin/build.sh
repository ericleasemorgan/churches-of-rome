#!/usr/bin/env bash

# build.sh - one script to rule them all

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 21, 2020 - first cut; during a pandemic


# initialize file system and summary
rm -rf ./pages
rm -rf ./tmp
mkdir -p ./pages
mkdir -p ./tmp
rm -rf ./summary.txt

# read the XML and output both SQL insert statements as well as wiki markup
echo "Step #1 of 5: Reading XML (Extracting identifiers, names, and wiki pages)" >&2
./bin/xml2markup.pl > ./tmp/inserts.sql

# create the database and initialize it with identifiers and church names
echo "Step #2 of 5: Initializing database (Filling database with identifiers and names)" >&2
./bin/db-initialize.sh
./bin/titles2db.sh

# read all pages, extract metadata, and update the database
echo "Step #3 of 5: Extracting and saving metadata (Reading and writing infobox data)" >&2
./bin/infobox2sql.sh
./bin/infobox2db.sh

# dump
echo "Step #4 of 5: Dumping database as CSV" >&2
./bin/db2csv.sh

# summarize
echo "Step #5 of 5: Summarizing" >&2
cat ./etc/summarize.sql | sqlite3 ./etc/roman-churches.db > ./summary.txt

# done
echo "Done" >&2
exit
