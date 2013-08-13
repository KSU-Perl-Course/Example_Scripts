#!/usr/bin/perl
use strict;
use warnings;
# USAGE: agp2scaffold.pl -f [contig_FASTA_filename] -a [AGP_filename] -o [optional_scaffold_FASTA_filename]
# LONG USAGE: agp2scaffold.pl --fasta [contig_FASTA_filename] --agp [AGP_filename] --out [optional_scaffold_FASTA_filename]

### load my modules ###
use Getopt::Long; # allows me to call arguments by name instead of order
use Bio::DB::Fasta; #makes a searchable db from my fasta file
use Bio::Seq;
use Bio::SeqIO; 

### declare variables for files, temporary seq_ids, and sequences and set default value for output ###
my ($fasta, $agp, $scaffold_id, $new_seq);
my $out="newest_scaffold.fa"; # default out file

### import my arguments ###
GetOptions(
	'f|fasta:s' => \$fasta,
	'a|agp:s'=> \$agp,
	'o|out:s'=> \$out);	
	
### sub change DB ids ###
  sub change_id 
  {
    my $description_line = shift;
    # get a different id from the fasta header, e.g.
         $description_line =~ /\|gb\|(\S+)\./;
    return $1;
  } 
  
### open my files ###
my $db = Bio::DB::Fasta->new("$fasta",-reindex=>1,-makeid=>\&change_id );	 # Create new DB object. BioPerl will warn you if no file specified
my $seq_out = Bio::SeqIO->new('-file' => ">$out",'-format' => 'fasta');		#Create new fasta outfile object.  
open(AGP,$agp) or die $!; 	# you need to request a warning for the AGP because we are opening with "open" not BioPerl

### loop through my AGP ###
while (<AGP>)
{
	chomp;
	my @columns=split('\t');
	
	### quick error traps and special cases ###
	if (($columns[4] eq "W") && (! $db->get_Seq_by_id($columns[5]))){print "Warning your scaffold file has been created but sequences including $columns[5] are not in $fasta.\n";exit;}	#use the "get_Seq_by_id" method to quit when your AGP begins listing sequence ids that are not in your DB
	unless ($scaffold_id) {$scaffold_id = $columns[0]; $new_seq  = '';}	 # start the first scaffold

	### continue building scaffolds ###
	if ($columns[0] eq $scaffold_id) 	# continue existing scaffold
	{
		if ($columns[4] eq "W") 	# if the AGP line describes a sequence
		{	$scaffold_id = $columns[0];
			my ($start,$stop) = ($columns[8] eq '+')?($columns[6], $columns[7]):($columns[7], $columns[6]); 	# "?:" operator tests if the sequence is in the forward or reverse direction and reverses start and stop if minus strand
			$new_seq = "$new_seq".$db->seq($columns[5],$start,$stop);
		}
		elsif ($columns[4] eq "N")		# if the AGP line describes a gap
		{	
			$new_seq = "$new_seq"."N" x $columns[5];
		}
	}	
	elsif ($columns[0] ne $scaffold_id) 	# End of Scaffold: create sequence object with the "new" method then write to the scaffold fasta with the "write_seq" method, reset seq_id and sequence variables
	{
		my $scaffold_obj = Bio::Seq->new( -display_id => $scaffold_id, -seq => $new_seq);
        $seq_out->write_seq($scaffold_obj);
		$scaffold_id = "$columns[0]";
		$new_seq = '';
		redo;
	}
	if(eof) 	# Last Scaffold: create sequence object with the "new" method then write to the scaffold fasta with the "write_seq" method

	{
		my $scaffold_obj = Bio::Seq->new( -display_id => $scaffold_id, -seq => $new_seq);
		$seq_out->write_seq($scaffold_obj);
	}	
}
