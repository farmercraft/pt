#!/usr/bin/env rakudo

use lib 'lib';
use lib '.';
use plot;
use util;
use Conf;

sub MAIN($dirs) 
{
    my $conf   = Conf.new;	
    my $prefix = $conf.mount_prefix;
    my $plots_dir = $conf.plots_dir;
    #my $file_type = $conf.file_type;
    my $sink   = $conf.mmx_sink;
    say $prefix;
    say $plots_dir;
    my @disks  = parse_comma($dirs);
    my $target = ""; 
    for @disks -> $d {
	my $tmp_dir   = $prefix ~ '/sd' ~ $d ~ '/' ~ $plots_dir;
	if ($tmp_dir.IO ~~ :e) {
	    $target = $target ~ "  " ~ $tmp_dir;
	} else {
	    say "$tmp_dir dosen't exist, need to create!!";
	}
    }
    say $target;
    my $sname = "write_" ~ $dirs; 
    qqx/tmux new -s $sname -d $sink $target/;
}
