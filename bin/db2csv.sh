#!/usr/bin/env bash

# db2csv.sh - dump the database to a CSV file

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 21, 2020 - first cut; during a pandemic


# configure
DB='./etc/roman-churches.db'
CSV='./etc/roman-churches.csv'
SQL=".output $CSV\n.mode csv\n.headers on\nSELECT * FROM churches ORDER BY name;"

# do the work and done
printf "$SQL" | sqlite3 $DB
exit
