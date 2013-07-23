#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

my $_ = "Brad, Nic and Jennifer are teaching a PERL course";
say $_;

(my $new1 = $_) =~ s/(Brad|Jennifer|Nic)/\U$1/gi;
say $new1;


(my $new2 = $_) =~ s/(Brad|Jennifer|Nic)/\l$1/gi;
say $new2;

(my $new3 = $_) =~ s/(Brad|Jennifer|Nic)/\L$1/gi;
say $new3;

(my $new4 = $_) =~ s/(Brad|Jennifer|Nic)/\L$1/gi;
say $new4;