#!/usr/bin/perl
use strict; use warnings;

use lib '/opt/kawbs/lib/perl';

use KAWBS::PlayWav qw(
    play_wav
    wav_file
);

use KAWBS::Constants qw(
    true false
);

# give it a number 0 to 299
# in cli , and it will work out the
# files to paplay

for my $i (@ARGV){
    chomp ($i);
    die "'$i' is not an integer\n" if $i !~ /^\d+$/;
    play_number($i) ;
}

sub play_number {
    my ($i) = @_;

    $i = $i + 0;

    if ($i <0 or $i > 299){
        die "$i out of range 0 to 299\n";
    }

    if ( wav_file($i) ) {
        play_wav($i);
        return;
    }

    my $hundreds = int($i/100)*100;
    if ($hundreds == $i){
        play_wav($i);
        return;
    }

    my $sub_hundreds = $i-$hundreds;

    my @play = ();
    if ( $hundreds > 0 ){
        push @play, "$hundreds-and";
    }

    if($sub_hundreds < 20 ){
        push @play, $sub_hundreds;
    } elsif ( wav_file($sub_hundreds)){
        push @play,$sub_hundreds;
    } else {
        my $tens = int($sub_hundreds/10)*10;
        my $units = $sub_hundreds-$tens;

        push @play, $tens;

        if ($units > 0){
            push @play, $units;
        }
    }

    play_wav(@play);
}

