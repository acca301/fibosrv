package Fibosrv::Mason;
use Poet qw($conf $poet);
use Poet::Moose;

extends 'Poet::Mason';

# Add customizations to Poet::Mason here.
#
# e.g. Add plugins
#
# override 'get_plugins' => sub {
#     return ( super(), 'LvalueAttributes', 'TidyObjectFiles' );
# }

# You can also create Mason subclasses in Fibosrv/Mason, e.g.
# Fibosrv::Mason::Request, and they will be autodetected by Mason.

1;