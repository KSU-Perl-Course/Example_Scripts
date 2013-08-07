#!/usr/bin/perl

use strict;
use warnings;

if(@ARGV != 1) {
  die "usage: ./download_contigs.pl organism.agp";
}

# load the AGP file
open AGP, '<', $ARGV[0] or die "Couldn't open $ARGV[0]: $!"; 
my @agp = <AGP>;
close AGP;

# get the contigs for the 1st 2 scaffolds
my $scaffold = '';	# stores the current scaffold
my $i = 0;		# stores the number of scaffolds processed so far
my @contigs;		# stores the names of the contigs in the 1st 2 scaffolds

foreach (@agp) {
  my @line = (split)[0,4,5];

  if($scaffold ne $line[0]) {
    $scaffold = $line[0];
    $i++;
  }

  if($i > 2) {
    last;		# exit the while loop
  }
  else {
    if($line[1] eq "W") {
      push(@contigs, $line[2]);
    }
  }
}

# download the contigs from NCBI
my $url = "\"http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=";
$url .= join(",", sort @contigs);
$url .= "&rettype=fasta&retmode=text\"";

`curl $url -o contigs.fa`;	# Mac OS data transfer
#`wget $url -O contigs.fa`;	# Linux data transfer
