#!/usr/bin/perl
# Bradley JSC Olson
# Kansas State University
# Summer Perl Course
# Chapter 7 Regex example

my $infile=$ARGV[0];

open(INFILE, "<$infile");

while(<INFILE>)
{
	if (/scaffold_[0-9]+/) #Matches scaffold_ followed by a number one or more times
	{
		print;
	}
}