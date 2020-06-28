#!/usr/bin/perl -w
use strict; use warnings;
use Device::ELM327;

my $device    = '/dev/ttyUSB0';	# default serial port for UNIX-like systems
my $baudrate  = 500000;
my $databits  = 8;
my $stopbits  = 1;
my $parity    = 'none';
my $handshake = 'none';

my $pid_cfg = {
    0x01 => {
        0x00 => {
            name => "PIDs Supported",
            conv => sub { },
        },
        0x01 => {


        },






    }
};

my $port_details = "$device:$baudrate:$parity:$databits:$stopbits:$handshake";
print "connect with :\n  $port_details\n";

my $obd = Device::ELM327->new($port_details);

if ( $obd->PortOk() ){
    print "port is okay\n";
} else {
    print "port is NOT okay\n";
}






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
#my $port = new Device::SerialPort($device)
#    || die "error opening serial dev $device $!\n";
#
## baud rate
#$baudrate = $port->baudrate($baudrate);
#
## databits
#$databits = $port->databits($databits);
#
## parity
#$parity = $port->parity($parity);
#
## stopbits
#$stopbits = $port->stopbits($stopbits);
#
## handshaking
#$handshake = $port->handshake($handshake);
#
## write settings
#$port->write_settings()
#    || die("error connectiong to serial port\n");
##
