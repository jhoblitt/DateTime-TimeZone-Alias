use Test::More qw(no_plan);

use strict;

use DateTime::TimeZone::Alias;

{
	# timezones
	foreach my $key ( @DateTime::TimeZone::ALL ) {
		is( DateTime::TimeZone::Alias->is_defined( $key ), 1 );
	}

	foreach my $key ( @DateTime::TimeZone::ALL ) {
		is( DateTime::TimeZone::Alias->is_timezone( $key ), 1 );
	}

	foreach my $key ( @DateTime::TimeZone::ALL ) {
		is( DateTime::TimeZone::Alias->is_alias( $key ), undef );
	}

	# aliases
	foreach my $key ( keys DateTime::TimeZone::LINKS ) {
		is( DateTime::TimeZone::Alias->is_defined( $key ), 1 );
	}

	foreach my $key ( keys DateTime::TimeZone::LINKS ) {
		is( DateTime::TimeZone::Alias->is_timezone( $key ), undef );
	}

	foreach my $key ( keys DateTime::TimeZone::LINKS ) {
		is( DateTime::TimeZone::Alias->is_alias( $key ), 1 );
	}
}
