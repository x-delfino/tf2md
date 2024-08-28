#!/usr/bin/perl
use strict;
use warnings;

# Read the entire file into a single string
$/ = undef; # Slurp mode

# Read input from a file (or STDIN if no filename is given)
my $filename = shift @ARGV or die "Usage: $0 filename\n";
open my $fh, '<', $filename or die "Can't open file $filename: $!\n";
my $content = <$fh>;
close $fh;

# Perform substitutions
$content =~ s/(\S+)\n(?:---).+?/```\n<\/details>\n\n<details>\n  <summary>$1<\/summary>\n\n```diff\n---/gs;
$content =~ s/^(?:```\n<\/details>\n\n)(.+)/$1\n```\n<\/details>\n/s;

# Print the modified content
print $content;
