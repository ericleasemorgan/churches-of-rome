#!/usr/bin/env bash

DB='./etc/roman-churches.db'
CSV='./etc/roman-churches.csv'
SQL=".output $CSV\n.mode csv\n.headers on\nSELECT * FROM churches ORDER BY name;"

printf "$SQL" | sqlite3 $DB
