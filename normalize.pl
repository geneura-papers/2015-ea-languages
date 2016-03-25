#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use File::Slurp::Tiny qw(read_lines);

my $file_name = shift || "measures-bitflip.csv";
my $norm = shift || "perl-BitString";

my @data = read_lines( $file_name, chomp => 1 );

if ( !@data ) {
  die "Can't read $file_name"
}

my %data;

my @columns = split( /,\s*/, $data[0] );
for my $d ( @data[1..$#data] ) {
  next if !$d;
  my @this_data = split(/\s*,\s*/,$d );
  $data{$this_data[0]}{$this_data[1]} = $this_data[2];
}

my %processed_data;
say join(", ", @columns), ", datastructure, normtime";
for my $l ( keys %data ) {
  my ($lang, $datas) = split("-",$l);
  for my $b ( keys %{$data{$l}} ) {
    say "$l, $b, $data{$l}{$b}, $datas, ", $data{$l}{$b}/$data{$norm}{$b};
  }
}

