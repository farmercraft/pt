unit module plot;

sub plotter($f_dir, $d, $f, $pub) is export
{
    my $d2 =  $d;
    
    my $proc = Proc::Async.new: 'bladebit', '-f', $f, '-c', $pub, $f_dir;
    return $proc;
}

sub nossd($s, $path, $addr) is export
{
    #say "tmux new -s $s -d  client  $path -s $s  -m 32G -c  5  -a $addr";	
    qqx/tmux new -s $s -d  client  $path -s $s  -m 32G -c  5  -a $addr/;	
}


