use Test::More tests => 2;

use strict;

use DateTime::TimeZone::Alias;

{
	my $tzs = DateTime::TimeZone::Alias->timezones();
	my $als = DateTime::TimeZone::Alias->aliases();

	is_deeply(
		\@DateTime::TimeZone::ALL,
		$tzs,
		"compare returned timezones with internals"
	);

	is_deeply(
		\%DateTime::TimeZone::LINKS,
		$als,
		"compare returned aliases with internals"
	);
}
