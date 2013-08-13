#!/usr/bin/perl

use strict;
use warnings;

use Bio::SeqIO;
use Bio::Seq;

if(@ARGV != 3) {
  die "usage: ./scaffold_bioperl.pl organism.agp contigs.fa scaffold.fa";
}

my $scaffold_name = "NW_001092766.1";          # the scaffold we'd like to generate
#my $scaffold_name = "NW_001094086.1";           # the scaffold we'd like to generate
my $scaffold;

# load the AGP file
open AGP, '<', $ARGV[0] or die "Couldn't open $ARGV[0]: $!";
my @agp = <AGP>;
close AGP;

my $contigs_seqIO = Bio::SeqIO->new(-file => $ARGV[1], -format => 'fasta');
my $scaffold_seqIO= Bio::SeqIO->new(-file => ">$ARGV[2]", -format => 'fasta', -flush => 1); 

# read the AGP file and process the lines that start with the scaffold name
foreach (@agp) {
  if(/^($scaffold_name)/) {
    my @line = (split)[4,5,6,7,8];
    if($line[0] eq "W") {       # contig
      while(my $seq = $contigs_seqIO->next_seq()) {
        if($seq->id =~ /\b($line[1])\b/) {
          if($line[4] eq "-") {
            $scaffold .= $seq->revcom()->subseq($line[2], $line[3]);
          }
          else {
            $scaffold .= $seq->subseq($line[2], $line[3]);
          }
        }
      }
      # go back to the beginning of the file
      seek($contigs_seqIO->_fh, 0, 0);
    }
    elsif($line[0] eq "N") {    # gap
      $scaffold .= "N" x $line[1];
    }
  }
}

# write the scaffold to file
my $scaffold_seq = Bio::Seq->new(-id => $scaffold_name, -seq => $scaffold);
$scaffold_seqIO->write_seq($scaffold_seq);
