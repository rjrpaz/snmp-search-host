#!/usr/bin/perl

use strict;

use Net::SNMP;

my ($session, $error) = Net::SNMP->session(
   -hostname  => shift || 'localhost',
   -community => shift || 'public',
   -port      => shift || 161

#   -hostname     => 'myv3host.company.com',
#   -version      => 'snmpv3',
#   -username     => 'myv3Username',
#   -authkey      => '0x05c7fbde31916f64da4d5b77156bdfa7',
#   -authprotocol => 'md5',
#   -privkey      => '0x93725fd3a02a48ce02df4e065a1c1746'
);

if (!defined($session)) {
   printf("ERROR: %s.\n", $error);
   exit 1;
}

my $sysContact = '1.3.6.1.2.1.1.4.0';

my $result = $session->set_request(
   -varbindlist => [$sysContact, OCTET_STRING, 'Help Desk x911']
);

if (!defined($result)) {
   printf("ERROR: %s.\n", $session->error);
   $session->close;
   exit 1;
}

printf("sysContact for host '%s' set to '%s'\n",
   $session->hostname, $result->{$sysContact}
);

$session->close;

exit 0;
