package DateTime::TimeZone::Alias;

use strict;

use DateTime::TimeZoneCatalog;

use vars qw( $VERSION );
$VERSION = 0.01;

sub import {
	my $class = shift;

	return unless @_;

	$class->set( @_ );

}

sub set {
	my $class = shift;

	return unless @_;

	my %p = @_;

	foreach my $key ( keys %p ) {
		$DateTime::TimeZone::LINKS{ $key } = $p{ $key };
	}
}

sub del {
	my $class = shift;

	return unless @_;

	foreach my $key ( @_ ) {
		delete $DateTime::TimeZone::LINKS{ $key };
	}
}

1;

__END__
