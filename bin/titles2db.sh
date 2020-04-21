#!/usr/bin/env bash


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