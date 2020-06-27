#!/usr/bin/perl
use strict; use warnings;
use lib '/opt/kawbs/lib/perl';

use AnyEvent;
use AnyEvent::MQTT;

use KAWBS::PlayWav qw(
    play_wavs
);

use KAWBS::Constants qw(
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
        print $topic, ' ', $message, "\n";
        # format of message is
        # numeric priority : space separated list of wav file names (minus .wav)
        # 0 is highest priority.
        # some massive integer is a lower priority
        # only accepts integers.

        if ( my ($prio, $play)= $message =~ /^\s*(\d+)\s*:(.*)$/){
            push @$play_queue, {
                priority => $prio,
                play => $play,
            };
            # sort the queue.
            @$play_queue = sort { $a->{priority} <=> $b->{priority} }
                             @$play_queue;

        } else {
            log_error("played.pl : bad format message :\n$message\n");
        }
    }
);

push @w , AnyEvent->timer (
   after    => .1,
   interval => .05,
   cb    => sub {
        if (@$play_queue > 0){
            my $que = pop @$play_queue;
            # print "timer_cb $que\n";
            play_wavs($que->{play}) ;
        }
   },
);

$quit_program->recv;

