#!/bin/perl

use strict;
use warnings;
my $infile=$ARGV[0];
open(FILE, "<$infile");
while (<FILE>)
{
  chomp;
	unless ($_ =~ /^#/) 
	{
		print "\"$_\" is not a comment\n";
	}
}
