#!/usr/bin/perl
use strict;
use NetAddr::IP;
use IO::Interface::Simple;

my $if = IO::Interface::Simple->new('eth0');

my $space = NetAddr::IP->new("$if->address/$if->netmask");

open (ARP, "arp -na |");
while (<ARP>) {
	chomp;
	next if ($_ =~ /incomplete/);
	next if ($_ !~ /eth0$/);

	(my $ip) = ($_ =~ /\s\(([^\)]*)/);

	print "===========================================================\n";
	print "Buscando equipo $ip\n";

	my $comando = "./buscar_equipo $ip";
	system($comando);
	print "===========================================================\n\n\n";
}
close (ARP);

