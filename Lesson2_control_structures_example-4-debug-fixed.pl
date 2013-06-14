#!/usr/bin/perl
# 2013-06-13 Bradley Olson
# Kansas State University
# Summer Perl Course
#
# Debugging user input

use warnings;
use strict;


#Get user input
print "What day is today: ";
my $today=<STDIN>;
chomp $today;

if (('Tuesday' eq $today) || ('Thursday' eq $today))
{
	print '$today is a class day!\n';
}
else
{
	print '$today is NOT a class day!\n';
}
