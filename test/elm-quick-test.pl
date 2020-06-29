#!/usr/bin/perl -w
use strict; use warnings;
use Device::ELM327;
use Time::HiRes qw( usleep );
use Data::Dumper;


# TODO die if not run as root. need root for serial connection.
#
#


my $device = '/dev/ttyUSB0';	# default serial port for UNIX-like systems
my $baudrate = 500000;
my $databits = 8;
my $stopbits = 1;
my $parity = 'none';
my $handshake = 'none';

my $port_details = "$device:$baudrate:$parity:$databits:$stopbits:$handshake";
print "connect with :\n $port_details\n";

my $obd = Device::ELM327->new($port_details);

if ( $obd->PortOK() ){
    print "port is okay\n";
    print $obd->ShowReadableValues();
    print "\n";
} else {
    die "port is NOT okay\n";
}


my $value_name="Engine RPM";
while (1) {

    print Dumper($obd->Show($value_name))."\n";
    usleep 200;

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
# || die "error opening serial dev $device $!\n";
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
# || die("error connectiong to serial port\n");
##
