#!/usr/bin/perl
# 2013-06-13 Bradley Olson
# Kansas State University
# Summer Perl Course
#
# Debugging user input

#Get user input
print "What day is today: ";
my $today=<STDIN>;

if ($today == 'Tuesday' || $today == 'Thursday')
{
	print '$today is a class day!\n';
}
else
	print '$today is NOT a class day!\n';
