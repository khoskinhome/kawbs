#!/usr/bin/perl -w
use strict; use warnings;

use Device::SerialPort;


my $def_device    = '/dev/ttyS0';	# default serial port for UNIX-like systems
my $def_baudrate  = 500000;
my $def_databits  = 8;
my $def_stopbits  = 1;
my $def_parity    = 'none';
my $def_handshake = 'none';




#while (1) {
#
#
#
#
#}
#
#
#sub send_to_elm {
#
#
#
#}
#
#
#  $port = new Device::SerialPort($device)
#    || msg_f("error opening serial device: $device\n", $EXIT_OPEN_PORT_ERROR);
#
#
