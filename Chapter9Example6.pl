#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

my $_ = "<tag>This text is tagged</tag>but this is not <tag>and so is this</tag>";
(my $new1 = $_) =~ s/<tag>(.+)<\/tag>/ $1/g;
#Greedily matches between furthermost tags
say $new1;

(my $new2 = $_) =~ s/<tag>(.+?)<\/tag>/ $1/g;
#Non-Greedily matches both tags
say $new2;