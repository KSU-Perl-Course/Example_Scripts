#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

my $file=$ARGV[0]; #GFF3 file
open (FILE, "<$file") || die $!;

while(<FILE>)
{
	unless(/^#/) #skip comment lines and ##gff-version 3 line
	{
		my @gff_fields = split /\t/, $_; #Split a gff line by \t
		my @gff_field9 = split /;/, $gff_fields[8]; #Split field 9 by semicolon
		say "my GFF fileds are @gff_fields";
		say "GFF field 9 split up is @gff_field9";
		my $gff_field9_re = join ":", @gff_field9;
		say "Reassembled filed 9 is $gff_field9_re";
		
		
		
	}
}