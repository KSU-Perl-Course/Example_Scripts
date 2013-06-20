#!/usr/bin/perl

use strict;
use warnings;

my @array = qw(perl ksu class);
print $array[0];
print "@array\n";
#print $array[-100];
my @alphabet=('a'..'z');
print "@alphabet\n";
my @nums=(1..10);
print "@nums\n";
my @test=(1..10);
print "@test\n";
push(@test,11);
print "@test\n";
print pop(@test);
print "@test\n";