use Test::More qw(no_plan);

use strict;

use DateTime::TimeZone::Alias;

{
	foreach my $key ( keys DateTime::TimeZone::LINKS ) {
		is( DateTime::TimeZone::Alias->value( $key ), %{ DateTime::TimeZone::LINKS }->{ $key } );
	}

	is( DateTime::TimeZone::Alias->value( 'Foo' ), undef );
}
