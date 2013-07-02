#!/usr/bin/perl

use strict;
use warnings;

my @data = (1, 4, 5);
my @data_four = (1, 4, 6, 7);

my $sum = &sum_of_three(@data);
print "The sum of @data is $sum\n";

my $bad_sum = &sum_of_three(@data_four);
print "This will not exectute because too much data in @data_four and the exit statement!\n";

sub sum_of_three
{
	if (@_ != 3)
	{
		print "Too few arguments passed to subroutine sum_of_three!\n";
		exit;
	}
	else
	{
		return $_[0]+$_[1]+$_[2];
	}
}
