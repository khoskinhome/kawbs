#!/usr/bin/perl
use strict; use warnings;

use Net::MQTT::Simple;

my $mqtt = Net::MQTT::Simple->new("localhost");
$mqtt->publish("meta" => "We're connected");

$mqtt->run(
        "+" => sub {
            my ($topic, $message) = @_;
            print "Topic: '$topic' '$message'\n";
        },
    );
