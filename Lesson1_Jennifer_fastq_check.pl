#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

# usage: Fasta_to_Fastq.pl [fasta_file] [fastq_file]
#initialized value of $i and declare variables
my $infile=$ARGV[0];
my $outfile=$ARGV[1];
my $i=0;
my($identifier, $description,$sequence,$qual);

#Open the file for over-writing, use the filehandle OLDFASTA
open (NEWFASTA, ">$outfile");

#Open the file for reading only, use the filehandle NEWFASTA
open(OLDFASTA, "<$infile");

my @outdata=(0,0,0,0); #4 element array, 0 is seqid, 1 is sequence, 2 is unused, 3 is qual
#Process the in file via its file handle IN
while(<OLDFASTA>)

{
    if($i==0) #loop for headers
    {
        s/^@/>/; #find and replace '@'
        ($identifier, $description)=split(' '); #split fasta header into two variables
        #print NEWFASTA "$identifier\n"; #print '>' and identifier
        $outdata[0] = $identifier;

        
    }
    elsif($i==1) #loop for sequence
    {
        #print NEWFASTA; #print sequence
        $outdata[1] = $_;
        #$sequence=$_;
        $i=-3; #make $i -2 to skip printing '+' and quality scores
    }
    elsif($i==-1) #loop for sequence
    {
    	$outdata[3] = $_;
    	&check_qual(@outdata);
    	
        #$qual=$_;
        
    }

    $i++;
    #print "i is $i\n";
    
}


#Subroutine takes a 4 element array of a fastq file
sub check_qual
{
	state $num=0;
	#print "@_\n";
	
	if ((length($_[1])) != (length($_[3])))
    {
    	print "Error length of sequence does not match length of quality scores\n";
        #print "$num\n";
        $num++;
    }
    elsif ($_[1]=~/N/)
    {
    	print "There are N's in a sequence\n";
    }
    elsif ($_[1]=~/^[A]+$/ || $_[1]=~/^[T]+$/ || $_[1]=~/^[C]+$/ || $_[1]=~/^[G]+$/)
    {
    	chomp $_[1];
    	print "This is a $_[1] homopolymer\n";
    	#check for homopolymers here
    }
        

}





