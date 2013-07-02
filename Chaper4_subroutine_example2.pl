#!/usr/bin/perl 

use warnings;
use strict;

#Define a subroutine

my $worked = &marine(qw(Frank Alice Sara));
print "Did the subroutine execute: $worked\n";

sub marine
{
	#marine takes on arguments in @_ or $_
	print "Marine was passed ";
	foreach my $ele (@_)
	{
		print "$ele ";
	}
	print "arguments\n";
	return 'Yes';
}

