use Test::More tests => 3;

use strict;

use DateTime;
use DateTime::TimeZone;
use DateTime::TimeZone::Alias;

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
