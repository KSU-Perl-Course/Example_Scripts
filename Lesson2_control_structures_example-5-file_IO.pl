#!/usr/bin/perl
#2013-06-13 Bradley Olson
# Kansas State University
# Summer Perl Course
#
# Example of file operations

#Prompt user for a file to process
print "What files would you like to process? ";
my $infile = <STDIN>;

#Open the infile to INFILE file handle for read only
open(INFILE, "<$infile");

#Go through every line of the file and print it to STDOUT
while(<INFILE>)
{
	print;
}
print "\n"; #Makes any file print cleanly
close INFILE;
