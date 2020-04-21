#!/usr/bin/env python

# infobox2sql.py - given a file (a wikimedia page), extract the infobox and output SQL update statements
# usage: find ./pages -name "*.txt" | parallel ./bin/infobox2sql.py > ./tmp/updates.sql

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 21, 2020 - first cut


# configure
FEILDS   = [ 'address', 'architect', 'artists', 'built', 'caption', 'clergy', 'consecrated', 'dedication', 'denomination', 'englishname', 'fax', 'image', 'national', 'phone', 'titular', 'type', 'url' ]
TEMPLATE = "UPDATE churches SET '##NAME##' = '##VALUE##' WHERE cid = '##CID##';"

# require
import sys
import re
import os

# sanity check
if len( sys.argv ) != 2 :
	sys.stderr.write( 'Usage: ' + sys.argv[ 0 ] + " <file>\n" )
	quit()

# initialize
file = sys.argv[ 1 ]

# open the given file and slurp it up
handle = open( file ) 
lines  = handle.readlines() 

# process each line of the file; extract the "infobox"
infobox = ''
for line in lines :
	line = line.strip()
	if ( line ) : infobox = infobox + line
	if ( re.search( "}}", line ) ) : break
	
# normalize the infobox; stupid carriage returns and extra spaces
infobox = infobox.replace( "|", " | " )
infobox = infobox.replace( "=", " = " )
infobox = infobox.replace( "}}", "|}}" )
infobox = re.sub(' +', ' ', infobox )

# extract the metadata; process each item in the infobox
metadata = {}
for field in infobox.split( '|' ) :
	
	# check for name/value pair
	if ( '=' in field ) :
		
		# split, parse, and update
		pair  = field.split( '=' )
		name  = pair[ 0 ].strip()
		value = pair[ 1 ].strip()
		metadata[ name ] = value

# for the next step, derive the church identifier
cid = os.path.splitext( os.path.basename( file ) )[ 0 ]

# process each metadata name/value pair
for name in metadata :
	
	# check for desirable field and an associated value
	if ( name in FEILDS and metadata[ name ] ) :
	
		# extract, normalize, and escape the value
		value = metadata[ name ]
		value = value.replace( '<br>', ' ' )
		value = value.replace( '[', '' )
		value = value.replace( ']', '' )
		value = value.replace( "'", "''" )
		
		# create sql statement
		update = TEMPLATE
		update = update.replace( '##NAME##', name )
		update = update.replace( '##VALUE##', value )
		update = update.replace( '##CID##', cid )
		
		# output
		print( update )
		
# done
exit()


