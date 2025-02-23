#!/usr/bin/env rakudo

use lib 'lib';
use lib '.';
use plot;
use util;
use Conf;

sub MAIN($dirs) 
{
    my $sname = "copy_" ~ $dirs; 
    qqx/tmux new -s $sname -d .\/mmx_copy.raku $dirs/;
}
