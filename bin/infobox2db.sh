#!/usr/bin/env bash

# infobox2db.sh - given a set of update statements, create and execute an SQL transaction

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 21, 2020 - first cut; during a pandemic


# configure
DB='./etc/roman-churches.db'
UPDATES='./tmp/updates.sql'
TRANSACTION='./tmp/transaction.sql'

# build a transaction
echo "BEGIN TRANSACTION;" >  $TRANSACTION
cat $UPDATES              >> $TRANSACTION
echo "END TRANSACTION;"   >> $TRANSACTION

# do the work and done
cat $TRANSACTION | sqlite3 $DB
exit