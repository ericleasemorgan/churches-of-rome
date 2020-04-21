#!/usr/bin/env bash


# configure
DB='./etc/roman-churches.db'
SCHEMA='./etc/schema.sql'

# initialize, do the work, and done
rm -rf $DB
cat $SCHEMA | sqlite3 $DB
exit
