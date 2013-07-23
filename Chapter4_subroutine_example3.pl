#!/usr/bin/perl

use strict;
use warnings;

my @data = qw(1 2 3 4 5);
my $result = &sum(@data);
print "The sum of @data is $result\n";

my $result2 = &sum2(@data);
print "However, the sum of the first two elements of @data is $result2\n";

sub sum
{
	my $s=0;
	foreach (@_)
	{
		$s+=$_;
	}
	return $s;
}

sub sum2
{
	$_[0]+$_[1]; #Note the IMPLICIT return value, not good in practice
	#Better written as 
	#return $_[0]+$_[1]; 
}
	