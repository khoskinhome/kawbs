package KAWBS::PlayWav;
use strict; use warnings;
use Exporter 'import';

our @EXPORT_OK = qw(
    play_wavs
    wav_file
);

use KAWBS::Constants qw(
    true false
    log_fatal log_error log_warn log_debug
    get_audio_dir
    INVALID_WAV_FILE
);

use Try::Tiny;

sub play_wavs {
    # accepts a list of word/phrases or numbers.
    # They should all be played with just one call to "system"
    #
    # If any of them are invalid an
    # "invalid wav file" will be played just once
    # for the entire list.
    # You need to look in the logs to see what wav files are missing.
    my $str = join( " " , @_);
    $str =~ s/^\s+//g;
    $str =~ s/\s+$//g;
    my @wav_words = split(/\s+/,$str);

    my $cmd = "";
    my $invalid_wav = false;

    for my $w ( @wav_words ){

        my $play_list = [];
        if ( $w =~ /^\d+$/ ){

            try {
                $play_list = _get_numbers($w)
            } catch {
                # TODO really need to play a
                # "number out of range"
                $invalid_wav = true;

            }
        } else {
            $play_list->[0] = $w;
        }

        for my $tw ( @$play_list ) {

            if (my $file = wav_file($tw)){
                $cmd .= _play_cmd($file);
            } else {
                $invalid_wav = true;
                log_error ( "$tw is invalid wav file in ".get_audio_dir."\n");
            }
        }
    }

    if ( $invalid_wav ) {
        $cmd .= _play_cmd(INVALID_WAV_FILE);
    }
    system($cmd);
}

sub wav_file {
    # if it exists then returns wav file name with full path
    # otherwise returns undef.
    my ($i) = @_;
    my $filename = get_audio_dir()."$i.wav";
    return $filename if -f $filename;
    return;
}

sub _play_cmd ($){
    my ($file) = @_;
    # So the aplay command might need to be :
    # "aplay -D bluealsa:DEV=00:00:00:00:00:00,PROFILE=A2DP sound.wav"
    # once the code that has the bluetooth adapter mac address is available.
    # currently this is depending on ~/.asoundrc
    # to be configured something like so :
    #defaults.bluealsa {
    #    interface "hci0"
    #    device 8B:13:69:8F:42:75
    #    profile "a2dp"
    #}
    #
    #pcm.btspeaker {
    # type plug
    #  slave {
    #    pcm {
    #      type bluealsa
    #      interface hci0
    #      device 8B:13:69:8F:42:75
    #      profile "a2dp"
    #    }
    #  }
    #  hint {
    #    show on
    #    description "Bluetooth Speaker"
    #  }
    #}
    #
    #pcm.!default {
    #    type plug
    #    slave.pcm "btspeaker"
    #}
    #ctl.!default {
    #    type hw
    #    card 0
    #}

    return "aplay -D bluealsa $file;";
}

sub _get_numbers {
    my ($i) = @_;

    $i = $i + 0;

    if ($i <0 or $i > 20000){
        log_fatal "$i out of range 0 to 20000\n";
    }

    if ($i > 499){
        # assuming to be the 500 rpm increments for rpm

        my $trunc_i = sprintf("%.0f", $i/500)*500;
        return [$trunc_i];
    }


    # Assuming to be 0 to 299 for kph / mph.
    if ( $i > 299 ) {
        log_fatal "$i out of range 0 to 299\n";
    }

    if ( wav_file($i) ) {
        return [$i];
    }

    my $hundreds = int($i/100)*100;
    if ($hundreds == $i){
        return [$i];
    }

    my $sub_hundreds = $i-$hundreds;

    my $num_list = [];

    if ( $hundreds > 0 ){
        push @$num_list, "$hundreds-and";
    }

    if($sub_hundreds < 20 ){
        push @$num_list, $sub_hundreds;
    } elsif ( wav_file($sub_hundreds)){
        push @$num_list,$sub_hundreds;
    } else {
        my $tens = int($sub_hundreds/10)*10;
        my $units = $sub_hundreds-$tens;

        push @$num_list, $tens;

        if ($units > 0){
            push @$num_list, $units;
        }
    }

    return $num_list;
}

1;

