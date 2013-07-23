#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

my $_ = "DNA contains XXXX bases, but proteins do not have XXXX bases";
say $_;
s/XXXX/ATCG/; #matches only the first occurance of XXXX
say $_;

$_ = "DNA contains XXXX bases, but proteins do not have XXXX bases";
say $_;
s/XXXX/ATCG/g; #matches ALL the first occurance of XXXX
say $_;
