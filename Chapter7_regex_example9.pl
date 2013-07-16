#!/usr/bin/perl
# Bradley JSC Olson
# Kansas State University
# Summer Perl Course
# Chapter 7 Regex example

$_ = "yabba dabba doo";
if (/y(.)(.)\2\1/) { # matches 'abba' 
	print "It matched the palindrone after the y!\n"; 
} 



$_ = "yabab dabab doo";
if (/y(.)(.)\1\2/) { # matches 'abba' 
	print "It matched the repeat after the y!\n"; 
} 
