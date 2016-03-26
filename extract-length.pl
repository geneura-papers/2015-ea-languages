#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use File::Slurp::Tiny qw(read_lines);

my $file_name = shift || "measures-bitflip-norm.csv";
my $length = shift || 256;

my @data = read_lines( $file_name, chomp => 1 );

if ( !@data ) {
  die "Can't read $file_name"
}

say $data[0];
for my $d ( @data[1..$#data] ) {
  next if !$d;
  my @this_data = split(/\s*,\s*/,$d );
  if ( $this_data[1] == $length ) {
    say $d;
  }

}



