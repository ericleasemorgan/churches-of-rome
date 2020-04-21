#!/usr/bin/env bash

# titles2db.sh - given a set of insert statements, create an SQL transaction and execute it

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 21, 2020 - first cut; during a pandemic


# configure
DB='./etc/roman-churches.db'
INSERTS='./tmp/inserts.sql'
TRANSACTION='./tmp/transaction.sql'

# build a transaction
echo "BEGIN TRANSACTION;" >  $TRANSACTION
cat $INSERTS              >> $TRANSACTION
echo "END TRANSACTION;"   >> $TRANSACTION

# do the work and done
cat $TRANSACTION | sqlite3 $DB
exit