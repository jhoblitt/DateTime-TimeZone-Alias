use Test::More tests => 4;

use strict;

use DateTime;
use DateTime::TimeZone;
use DateTime::TimeZone::Alias;

# passing a hash to set
DateTime::TimeZone::Alias->set( Lagos => 'Africa/Lagos', Qatar => 'Asia/Qatar' );

{
	my $dt = DateTime->now( time_zone => 'Lagos' );
	isa_ok( $dt, 'DateTime' );

	my $dttz = $dt->time_zone();
	isa_ok( $dttz, 'DateTime::TimeZone::Africa::Lagos' );
}

{
	my $dttz = DateTime::TimeZone->new( name => 'Qatar' );
	isa_ok( $dttz, 'DateTime::TimeZone::Asia::Qatar' );
}

# trying to set an alias to in invalid timezone
{
	eval { DateTime::TimeZone::Alias->set( foo => 'bar' ) };
	like( $@, qr/Aliases must point to a valid timezone/ );
}
