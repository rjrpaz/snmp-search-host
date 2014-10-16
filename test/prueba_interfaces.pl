#!/usr/bin/perl
        use IO::Interface::Simple;

        my $if1   = IO::Interface::Simple->new('eth0');
        my $if2   = IO::Interface::Simple->new_from_address('127.0.0.1');
        my $if3   = IO::Interface::Simple->new_from_index(1);

        my @interfaces = IO::Interface::Simple->interfaces;

        for my $if (@interfaces) {
           print "interface = $if\n";
           print "addr =      ",$if->address,"\n",
                 "broadcast = ",$if->broadcast,"\n",
                 "netmask =   ",$if->netmask,"\n",
                 "dstaddr =   ",$if->dstaddr,"\n",
                 "hwaddr =    ",$if->hwaddr,"\n",
                 "mtu =       ",$if->mtu,"\n",
                 "metric =    ",$if->metric,"\n",
                 "index =     ",$if->index,"\n";

           print "is running\n"     if $if->is_running;
           print "is broadcast\n"   if $if->is_broadcast;
           print "is p-to-p\n"      if $if->is_pt2pt;
           print "is loopback\n"    if $if->is_loopback;
           print "is promiscuous\n" if $if->is_promiscuous;
           print "is multicast\n"   if $if->is_multicast;
           print "is notrailers\n"  if $if->is_notrailers;
           print "is noarp\n"       if $if->is_noarp;
	}
