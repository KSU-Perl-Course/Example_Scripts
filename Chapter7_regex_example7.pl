#!/usr/bin/perl
# Bradley JSC Olson
# Kansas State University
# Summer Perl Course
# Chapter 7 Regex example

my $infile=$ARGV[0];

open(INFILE, "<$infile");

while(<INFILE>)
{
	if (/(five|three)_prime_UTR/) #Match 5 or 3 primer utr
	{
		print;
	}
}