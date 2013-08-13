#!/usr/bin/perl

use strict;
use warnings;

use Bio::SeqIO;
use Bio::Seq;

# $ARGV[0] is the AGP file

my ($agp, $contig, $scaffold) = @ARGV;

my %contigs_fasta;

open AGP, $agp or die "Couldn't open $agp: $!";
my $inIO = Bio::SeqIO->new(-file => $contig, -format=>'FASTA');
my $outIO = Bio::SeqIO->new(-file => ">$scaffold", -format=>'FASTA');

while(<AGP>) {
  
}
