use Test::More tests => 2;

use strict;

use DateTime;
use DateTime::TimeZone::Alias SHT => 'US/Hawaii';

{
	my $dt = DateTime->now( time_zone => 'SHT' );
	isa_ok( $dt, 'DateTime' );

	my $dttz = $dt->time_zone();
	isa_ok( $dttz, 'DateTime::TimeZone::Pacific::Honolulu' );
}
