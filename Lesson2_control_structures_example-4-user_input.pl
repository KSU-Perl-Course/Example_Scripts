#!/usr/bin/perl
# 2013-06-13 Bradley Olson
# Kansas State University
# Summer Perl Course
#
# Example script for user input

use strict;
use warnings;

# Get user input values from the keyboard
print "What is your first name: ";
my $first_name=<STDIN>; # Get users first name from keyboard
chomp($first_name); #remove \n from input string
print "What is your last name: ";
my $last_name=<STDIN>;
chomp($last_name); #remove \n from input string

if ($first_name lt $last_name) # String operator to determine if length of first is shorter
{
	print "Your first name, $first_name, is shorter than your last name $last_name\n";
}
elsif ($first_name gt $last_name) # String operator to determine if length of first is longer
{
	print "Your first name, $first_name, is longer than your last name $last_name\n";
}
elsif ($first_name eq $last_name) # String operator to determine if length of first is the same length
{
	print "Your first name, $first_name, is the same length as your last name $last_name\n";
}
else # This catches any input errors. 
{
	print "I can't understand your input, please try again\n";
	exit;
}	