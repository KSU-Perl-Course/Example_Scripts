#!/usr/bin/perl

use strict;
use warnings;

chomp(my @lines = <STDIN>); 

foreach my $ele (@lines)
{
	print "$ele\n";
}