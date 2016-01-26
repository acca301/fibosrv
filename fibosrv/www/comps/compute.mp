# Do not wrap into default "Base" debugger
CLASS->no_wrap;

# Accept a single REST argument
route "{uinput:}";

#
#	The algorithm is taken from
#	https://en.wikibooks.org/wiki/Algorithm_Implementation/Mathematics/Fibonacci_Number_Program#Recursive_versions
#
sub fib {
    my ($n) = @_;
    return 0 if ($n == 0);
    return (0, 1) if ($n == 1);
    my @fib = fib($n - 1);
    return (@fib, $fib[-1] + $fib[-2]);
}

method handle {
    my $x = $.uinput;
    $x =~ s/\s//g;
    return (print "\n")	if $x eq '/';
    return (print "Please enter digits only\n") if $x =~ /\D/;
    return (print "You have reached computational infinity. Do not request above 1500 numbers\n") if $x> 1500;
    print join(' ', fib($x ? $x-1 : 0)), "\n";
}
