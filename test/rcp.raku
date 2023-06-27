#!/usr/bin/env rakudo
use lib "../lib";
use util;

sub MAIN($h="h.txt")
{
	my $host = "./c8.txt";
	my $ca   = "./ca";
	for $host.IO.lines() -> $h {
	    say $h;
	    qqx/scp -r $ca  $h@$h:~\//;
	}
}