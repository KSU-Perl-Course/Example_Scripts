#!/usr/bin/perl

use strict;
use warnings;

if(@ARGV != 3) {
  die "usage: ./scaffold.pl organism.agp contigs.fa scaffold.fa";
}

my $scaffold_name = "NW_001092766.1";		# the scaffold we'd like to generate
#my $scaffold_name = "NW_001094086.1";		# the scaffold we'd like to generate
my $scaffold_seq;				# FASTA sequence

# load the AGP file
open AGP, '<', $ARGV[0] or die "Couldn't open $ARGV[0]: $!";
my @agp = <AGP>;
close AGP;

# read the AGP file and process the lines that start with the scaffold name
foreach (@agp) {
  if(/^($scaffold_name)/) {
    my @line = (split)[4,5,6,7,8];
    if($line[0] eq "W") {	# contig
      my $contig_seq = &contig($line[1], $line[2], $line[3]);
      if($line[4] eq "-") {
        $scaffold_seq .= &reversed_complement($contig_seq);
      }
      else {
        $scaffold_seq .= $contig_seq;
      }
    }
    elsif($line[0] eq "N") {	# gap
      $scaffold_seq .= "N" x $line[1];
    }
  }
}

# write the scaffold to file and display its length
my $cols = 60;	# number of characters to output per line
my $loc = 0;	# current location
my $seq_len = length($scaffold_seq);

open FA, '>', $ARGV[2] or die "Couldn't open $ARGV[2]: $!";
print FA ">$scaffold_name\n";
while($loc < $seq_len) {
  print FA substr($scaffold_seq, $loc, $cols), "\n";
  $loc += $cols;
}
close FA;
print "Scaffold $scaffold_name has $seq_len nucleotides\n";

sub reversed_complement {
  $_ = uc(shift);	# uppercase the sequence
  s/A/a/g;		# replace every A with a
  s/T/A/g;		# replace every T with A
  s/a/T/g;		# replace every a with T

  s/C/c/g;		# replace every C with c
  s/G/C/g;		# replace every G with C
  s/c/G/g;		# replace every c with G

  return scalar reverse;
}

sub contig {
  my ($contig_name, $contig_start, $contig_end) = @_;
  my $sequence;
  my $found = 0;		# flag

  open FA, '<', $ARGV[1] or die "Couldn't open $ARGV[1]: $!";
  while(<FA>) {
    unless(/^\s*$/) {		# skip blank lines
      chomp;
      if(/^>/) {		# description line
        if(/($contig_name)/) {
          $found = 1;
        }
        else {
          $found = 0;
        }
      }
      else {			# sequence line
        if($found) {
          $sequence .= $_;
        }
      }
    }
  }
  close FA;

  die "$contig_name was not found in the FASTA file." if length($sequence) == 0;

  return substr($sequence, $contig_start - 1, $contig_end - $contig_start + 1);
}
