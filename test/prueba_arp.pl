#!/usr/bin/perl
use Net::ARP;

$mac = Net::ARP::arp_lookup('eth0','10.0.7.89');

print "$mac\n";
