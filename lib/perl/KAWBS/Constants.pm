package KAWBS::Constants;
use strict; use warnings;

use Exporter 'import';

our @EXPORT_OK = qw(
    true false
    $AUDIO_DIR
    $INVALID_WAV_FILE
);

sub true  {1};
sub false {0};

our $AUDIO_DIR = "/opt/kawbs/audio/english-karl/";

our $INVALID_WAV_FILE = "${AUDIO_DIR}/invalid-wav-file.wav";

1;

