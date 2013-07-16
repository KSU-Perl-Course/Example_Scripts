#!/usr/bin/perl
# Bradley JSC Olson
# Kansas State University
# Summer Perl Course
# Chapter 7 Regex example

my $infile=$ARGV[0];

open(INFILE, "<$infile");

while(<INFILE>)
{
	if (/(.)\1/) #Match repeated characters
	{
		print;
	}
}