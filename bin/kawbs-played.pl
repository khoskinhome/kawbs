#!/usr/bin/perl
use strict; use warnings;

use Net::MQTT::Simple;

my $mqtt = Net::MQTT::Simple->new("localhost");
$mqtt->publish("meta" => "We're connected");


our $PLAYED_TOPIC="played";

my $play_queue = [];


$mqtt->run(
        "+" => sub {
            my ($topic, $message) = @_;

            print "Topic: '$topic' '$message'\n";

            if ($topic eq $PLAYED_TOPIC){
                push @$play_queue, $message;
                print "pushed to queue\n";<F9>
            } else {

            }


        },
    );
