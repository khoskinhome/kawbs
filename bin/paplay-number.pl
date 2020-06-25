#!/usr/bin/perl
use strict; use warnings;
sub true  {1};
sub false {0};
our $AUDIO_DIR = "/opt/kawbs/audio/english-karl/";
our $INVALID_WAV_FILE = "${AUDIO_DIR}/invalid-wav-file.wav";

# give it a number 0 to 299
# in cli , and it will work out the
# files to paplay

my $i = $ARGV[0];
chomp ($i);
die "'$i' is not an integer\n" if $i !~ /^\d+$/;

play_number($i) ;

sub play_number {
    my ($i) = @_;

    $i = $i + 0;

    if ($i <0 or $i > 299){
        die "$i out of range 0 to 299\n";
    }

    if ( -f wav_file($i) ) {
        paplay_numbers($i);
        return;
    }

    my $hundreds = int($i/100)*100;
    if ($hundreds == $i){
        paplay_numbers($i);
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

    paplay_numbers(@play);
}

sub wav_file {
    my ($i) = @_;
    my $filename = "$AUDIO_DIR/$i.wav";
    return $filename if -f $filename;
    return;
}

sub paplay_numbers {
    my @nums = @_;

    my $cmd ="";
    for my $n ( @nums ){
        if (my $file = wav_file($n)){
            $cmd .= "paplay  $file;";
        } else {
            system("paplay $INVALID_WAV_FILE");
            die "Can't find $n.wav\n";
        }
    }
    system($cmd);
}
