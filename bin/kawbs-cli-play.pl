#!/usr/bin/perl
use strict; use warnings;
use lib '/opt/kawbs/lib/perl';

use KAWBS::PlayWav qw(
    play_wavs
);

# todo have a param for the voice directory
# Then just play the rest of the ARGV

play_wavs(@ARGV) ;

