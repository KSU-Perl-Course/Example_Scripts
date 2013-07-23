#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

my $file=$ARGV[0]; #Tab delineated half matrix file
open (FILE, "<$file") || die $!;

while(<FILE>)
{
	my @data = /\d/g;
	my $colon_delin = join ":", @data;
	say $colon_delin;
}