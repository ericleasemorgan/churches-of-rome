#!/usr/bin/env perl

# xml2markup.pl - given an XML file of a specific shape, output both sets of SQL statements and plain text files

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# April 20, 2020 - first cut; during a pandemic


# configure
use constant XML       => './etc/roman-churches.xml';
use constant TEMPLATE  => "INSERT INTO churches ( 'cid', 'name' ) VALUES ( '##CID##', '##NAME##' );";
use constant DIRECTORY => './pages';

# require
use strict;
use XML::XPath;

# initialize
binmode ( STDOUT, ':utf8' );
my $parser = XML::XPath->new( filename => XML );

# find and process all pages
foreach my $page ( $parser->find( '//page' )->get_nodelist ) {

	# only process pages with an ns value of zero (0)
	next if ( $page->findvalue( './ns' ) ne '0' );
	
	# get identifier, name, and text
	my $cid  = $page->findvalue( './id' );
	my $name = $page->findvalue( './title' );
	my $text = $page->findvalue( './revision/text' );

 	# only want pages describing churches
	if ( $text =~ /{{Infobox church/ ) {
	
		# escape name
		$name =~ s/'/''/g;
		
		# create and output SQL insert statement
		my $insert =  TEMPLATE;
		$insert    =~ s/##CID##/$cid/e;
		$insert    =~ s/##NAME##/$name/e;
		print "$insert\n";
		
		# save text (wiki markup)
		my $file = DIRECTORY . "/$cid.txt";
		open FILE, " > $file" or die "Can't open $file ($!). Call Eric.\n";
		binmode ( FILE, ':utf8' );
		print FILE $text;
		close FILE;
			
	}

}

# done
exit;
