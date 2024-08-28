#!/usr/bin/perl
use strict;
use warnings;

# Set the input record separator to undef to slurp whole files
local $/ = undef;

# Process each file specified on the command line or standard input
while (my $content = <>) {
    # Perform substitutions
    $content =~ s/(\S+)\n(?:---).+?/```\n<\/details>\n\n<details>\n  <summary>$1<\/summary>\n\n```diff\n---/gs;
    $content =~ s/^(?:```\n<\/details>\n\n)(.+)/$1\n```\n<\/details>\n/s;
    # Print the modified content
    print $content;
}

