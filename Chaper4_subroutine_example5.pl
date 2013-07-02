#!/usr/bin/perl

use strict;
use warnings;

my @data = qw(1 2 3 4 5);
my $result = &sum(@data);
print "The sum of @data is $result\n";

#Ooops
my @data2;
my $result2 = &sum;
print "The sum of @data2 is $result2\n"; #this won't print 

sub sum
{
	unless (@_ == 0)
	{
		my $s=0;
		foreach (@_)
		{
			$s+=$_;
		}
		return $s;
	}
	else
	{
		print "No data passsed to subroutine sum\n";
		exit;
	}
}

