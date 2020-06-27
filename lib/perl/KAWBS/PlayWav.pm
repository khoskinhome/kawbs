package KAWBS::PlayWav;
use strict; use warnings;
#use lib '/opt/kawbs/lib/perl';

use Exporter 'import';

my $PLAY_CMD "aplay -D bluealsa";

our @EXPORT_OK = qw(
    play_wav
    wav_file
);

sub wav_file {
    my ($i) = @_;
    my $filename = "$AUDIO_DIR/$i.wav";
    return $filename if -f $filename;
    return;
}

sub play_wav {
    my @nums = @_;

    my $cmd ="";
    for my $n ( @nums ){
        if (my $file = wav_file($n)){
            $cmd .= "$PLAY_CMD  $file;";
        } else {
            system("$PLAY_CMD $INVALID_WAV_FILE");
            die "Can't find $n.wav\n";
        }
    }
    system($cmd);
}

1;

