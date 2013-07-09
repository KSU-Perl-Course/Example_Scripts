#!/usr/bin/perl
# Bradley JSC Olson
# Kansas State University
# Summer Perl Course
# Hashing a GFF file demo


use warnings;
use strict;
use YAML;

#Get a GFF file in
my $infile = $ARGV[0];

open(INFILE, "<$infile");

my %locations;
while(<INFILE>)
{
	chomp;
	#Skip over lines that are comments
	unless (/^#/)
	{
		#Make an array out of the GFF line, split by \t
		my @line = split("\t", $_);
		
		#Seqids are in column 8 counting by 0
		my $seqid=$line[8];
		#Clean up seqid that looks something like: D=PAC:17671488.CDS.1;Parent=PAC:17671488;pacid=17671488
		$seqid=~s/ID=//;
		$seqid=~s/\;.+//;
	
		#Create complex data structure
		my @s;
		push (@s, $line[3]);
		push (@s, $line[4]);
		$locations{$seqid} = \@s;
		
	}
}


#print Dump(%locations);

#Assign $key and $value to each element of %locations
while (my ($key, $value) = each %locations)
{
	#Print the key value pairs
	print "$key => $value->[0] - $value->[1]\n";
	
}

