#!/usr/bin/perl

use strict;
use warnings;

#Takes a command line argument, which is a file to process
my $infile=$ARGV[0];

#Open the file for reading only, use the filehandle IN
open(IN, "<$infile");

#Initialize the array @data, do it here so it is accessible to the whole script
my @data;

#Process the in file via its file handle IN
while(<IN>)
{
	#$_ stores data from each line as the script reads through it
	#Store the data from each line in the array @data via push
	push(@data, $_);
}

#Now that we have a giant array of data, print the whole thing out
print "@data\n";

#Lets print the data tab delineated
#This example uses anonymous references, but you have to use chomp!
foreach (@data)
{
	chomp;
	print;
	print "\t";
}

#This example uses explicit refrences to elements, but you do not have to chomp
foreach my $ele (@data)
{
	print "$ele\t";
}
	