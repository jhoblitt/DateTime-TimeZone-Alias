use Test::More tests => 2;

use strict;

use DateTime;
use DateTime::TimeZone;
use DateTime::TimeZone::Alias;

{
	DateTime::TimeZone::Alias->set( yap => 'Pacific/Yap' );

	my $dt = DateTime->now( time_zone => 'yap' );
	isa_ok( $dt, 'DateTime' );

	DateTime::TimeZone::Alias->remove( yap => 'Pacific/Yap' );

	eval { DateTime::TimeZone->new( name => 'yap' ) };
	like( $@, qr/Invalid offset/ );
}
