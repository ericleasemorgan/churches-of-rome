#!/usr/bin/env bash


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