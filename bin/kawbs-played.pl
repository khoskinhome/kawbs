#!/usr/bin/perl
use strict; use warnings;

# Karl Hoskin . 2020.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# Artistic License 2.0 for more details.
#
# You should have received a copy of the Artistic License 2.0 along
# with this program in the file named LICENSE. If not, please see
# <http://www.perlfoundation.org/artistic_license_2_0>.

use lib '/opt/kawbs/lib/perl';

use Data::Dumper;
use AnyEvent;
use AnyEvent::MQTT;

use KAWBS::PlayWav qw(
    play_wavs
);

use KAWBS::Constants qw(
    get_words_priority
    $KAWBS_PLAYED_MQTT_TOPIC
    log_fatal log_error log_warn log_debug
);

my $play_queue = [];

my $quit_program = AnyEvent->condvar;
my @w; # watchers.

my $mqtt = AnyEvent::MQTT->new(host => "localhost");

push @w , $mqtt->subscribe(
    topic =>$KAWBS_PLAYED_MQTT_TOPIC,
    callback => sub {
        my ($topic, $message) = @_;
        log_debug("received $topic : $message \n");

        # format of message is a space separated list of
        # numbers and words to play

        my $prio =  get_words_priority($message);
        push @$play_queue, {
            priority => $prio,
            play => $message,
        };

        @$play_queue = sort { $b->{priority} <=> $a->{priority} }
                         @$play_queue;
    }
);

push @w , AnyEvent->timer (
   after    => .1,
   interval => .05,
   cb    => sub {
        if (@$play_queue > 0){
            log_debug("play queue is :\n". Dumper ($play_queue));
            my $que = pop @$play_queue;
            # print "timer_cb $que\n";
            play_wavs($que->{play}) ;
        }
   },
);

$quit_program->recv;

