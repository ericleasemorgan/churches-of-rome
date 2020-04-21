#!/usr/bin/env bash

# configure
INFOBOX2SQL='./bin/infobox2sql.py'
UPDATES='./tmp/updates.sql'
PAGES='./pages'

# initialize
rm -rf $UPDATES

# do the work and done
find $PAGES -name *.txt | parallel $INFOBOX2SQL > $UPDATES
exit
