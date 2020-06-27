package KAWBS::Constants;
use strict; use warnings;

use Exporter 'import';

our @EXPORT_OK = qw(
    true false
    get_audio_dir

    log_fatal log_error log_warn log_debug

    AUDIO_DIR_DEFAULT
    INVALID_WAV_FILE
    $KAWBS_PLAYED_MQTT_TOPIC
);

sub true  (){1};
sub false (){0};

{
    # TODO this really needs to read in from
    # a config file.
    sub AUDIO_DIR_DEFAULT (){"/opt/kawbs/audio/english-karl/"};

    my $aud_dir = AUDIO_DIR_DEFAULT();
    sub get_audio_dir (){
        return $aud_dir;

    }
    sub set_audio_dir ($){
        my ($dir) = @_;
        if ( ! -d  $dir) {
            die "$dir is not a valid directory\n";
        }
        # TODO could check for list of standard wav files.
        # die if directory doesn't have them.
        $dir =~ s/\/+$/\//g;

        $aud_dir = $dir;
    }
}

our $KAWBS_PLAYED_MQTT_TOPIC="played";

sub INVALID_WAV_FILE {  get_audio_dir()."invalid-wav-file.wav" };

sub log_fatal($){ die  "FATAL : $_[0]\n"}
sub log_error($){ warn "ERROR : $_[0]\n"}
sub log_warn ($){ warn "WARN  : $_[0]\n"}
sub log_debug($){ warn "DEBUG : $_[0]\n"}

sub number_wavs_compulsory (){
    return qw(
        0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
        20 30 40 50 60 70 80 90 100 100-and 200 200-and
    );
}

sub number_wav_nice_to_have (){
    return qw(
        22 32 42 52 62 72 82 92
        24 34 44 54 64 74 84 94
        25 35 45 55 65 75 85 95
        26 36 46 56 66 76 86 96
        28 38 48 58 68 78 88 98

        122 132 142 152 162 172 182 192
        124 134 144 154 164 174 184 194
        125 135 145 155 165 175 185 195
        126 136 146 156 166 176 186 196
        128 138 148 158 168 178 188 198

        222 232 242 252 262 272 282 292
        224 234 244 254 264 274 284 294
        225 235 245 255 265 275 285 295
        226 236 246 256 266 276 286 296
        228 238 248 258 268 278 288 298
    );
}

sub word_wav_compulsory (){
    return qw(
        alerts-off alerts-on
        speed-off speed-on
        wifi-off wifi-on
        connected
        invalid-wav-file

        a-b-s battery brakes-warning brakes
        engine-temperature engine-warning
        not-charging
        oil-pressure
        speed-camera
        temperature-warning temperature
        too-fast
        tyre-pressure tyres
        unknown-warning warning

        kilometres-per-hour k-p-h
        miles-per-hour m-p-h

        first second  third  fourth fifth
        sixth seventh eighth nineth tenth
        gear-too-high

        silence
        low-fuel
        left right relay-click
    );
}

# Define the word priority here.
# 0 is for the highest priority words
#
# A phrase gets it's priority from the highest priority
# word/phrase.
sub word_priority () {
    return {
         5 => [qw(
            connected
            invalid-wav-file
        )],
        10 => [qw(
            alerts-on alerts-off
            speed-on speed-off
            wifi-off wifi-on
        )],
        20 => [qw(
            a-b-s battery brakes-warning brakes
            engine-temperature engine-warning
            not-charging
            oil-pressure
            speed-camera
            temperature-warning temperature
            too-fast
            tyre-pressure tyres
            unknown-warning warning
        )],
        30 => [qw(
            kilometres-per-hour k-p-h
            miles-per-hour m-p-h
        )],
        40 => [qw(
            first second  third  fourth fifth
            sixth seventh eighth nineth tenth
            gear-too-high
            gear

        )],
        50 => [qw(
            silence
            low-fuel
            left right relay-click
        )],
    };
}


#{
#    my $word
#
#
#
#
#
#}
#

1;

