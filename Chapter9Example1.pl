#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

my $_ = "How is Frank today?";
say $_;
s/Frank/Gertrude/; 
say $_;


$_ = "DNA contains ATCG bases";
say $_;
s/(ATCG)/RNA uses different bases than $1 in DNA/; #put capture in ()!
say $_;