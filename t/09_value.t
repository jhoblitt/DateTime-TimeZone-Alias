use Test::More qw(no_plan);

use strict;

use DateTime::TimeZone::Alias;

{
	foreach my $key ( keys DateTime::TimeZone::LINKS ) {
		is( DateTime::TimeZone::Alias->value( $key ), %{ DateTime::TimeZone::LINKS }->{ $key } );
	}

	# DT::TZ::ALL is only used as a source of non-alias (LINKS) values
	foreach my $key ( @DateTime::TimeZone::ALL ) {
		is( DateTime::TimeZone::Alias->value( $key ), undef );
	}
}
