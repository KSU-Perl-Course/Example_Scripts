#!/usr/bin/perl
# Bradley JSC Olson
# Kansas State University
# Summer Perl Course
# Chapter 7 Regex example

my $infile=$ARGV[0];

open(INFILE, "<$infile");

while(<INFILE>)
{
	if (/phytozome9_0\tgene/) #Matches any line with 'phytozome9_0\tgene' anywhere in the line
	{
		print;
	}
}