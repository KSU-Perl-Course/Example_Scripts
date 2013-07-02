#!/usr/bin/perl 

use warnings;
use strict;

#Define a subroutine

&marine(qw(Frank Alice Sara));

sub marine
{
	#marine takes on arguments in @_ or $_
	print "Marine was passed ";
	foreach my $ele (@_)
	{
		print "$ele ";
	}
	print "arguments\n";
}

