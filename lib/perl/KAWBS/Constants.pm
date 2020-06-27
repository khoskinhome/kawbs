package KAWBS::Constants;
use strict; use warnings;

use Exporter 'import';

our @EXPORT_OK = qw(
    true false
    get_audio_dir

    log_fatal log_error log_warn log_debug

    AUDIO_DIR_DEFAULT
    INVALID_WAV_FILE
);

sub true  (){1};
sub false (){0};

{
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

sub INVALID_WAV_FILE {  get_audio_dir()."invalid-wav-file.wav" };

sub log_fatal($){ die  "FATAL : $_[0]\n"}
sub log_error($){ warn "ERROR : $_[0]\n"}
sub log_warn ($){ warn "WARN  : $_[0]\n"}
sub log_debug($){ warn "DEBUG : $_[0]\n"}

1;

