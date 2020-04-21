#!/usr/bin/env bash

# infobox2sql.sh - a front-end to ./bin/infobox2sql.py

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 21, 2020 - first cut; during a pandemic


# configure
INFOBOX2SQL='./bin/infobox2sql.py'
UPDATES='./tmp/updates.sql'
PAGES='./pages'

# initialize, do the work, and done
rm -rf $UPDATES
find $PAGES -name "*.txt" | parallel $INFOBOX2SQL > $UPDATES
exit
