package DateTime::TimeZone::Alias;

use strict;

use Carp qw( croak );
use DateTime::TimeZoneCatalog;

use vars qw( $VERSION );
$VERSION = 0.04;

sub import {
	my $class = shift;

	return unless @_;

	$class->set( @_ );
}

sub set {
	my $class = shift;

	croak "Can't be called without any parameters" unless @_;

	my %p = @_;

	foreach my $key ( keys %p ) {
		if ( $class->is_alias( $p{ $key } ) ) {
			$DateTime::TimeZone::LINKS{ $key } =
				$DateTime::TimeZone::LINKS{ $p{ $key } }; 
		} elsif ( $class->is_timezone( $p{ $key } ) ) {
			$DateTime::TimeZone::LINKS{ $key } = $p{ $key };
		} else {
			croak "Aliases must point to a valid timezone";
		}
	}
}

sub add {
	my $class = shift;

	croak "Can't be called without any parameters" unless @_;

	my %p = @_;

	foreach my $key ( keys %p ) {
		if ( ! $class->is_defined( $key )) {
			$class->set( %p );
		} else {
			croak "Attempt to redefine an alias or timezone";
		}
	}
}

sub remove {
	my $class = shift;

	return unless @_;

	foreach my $key ( @_ ) {
		if ( ! $class->is_alias( $key ) ) {
			croak "Attempt to delete a nonexistant alias";
		}

		delete $DateTime::TimeZone::LINKS{ $key };
	}
}

sub value {
	my( $class, $key ) = @_;

	if ( $class->is_alias( $key ) ) {
		return $DateTime::TimeZone::LINKS{ $key };
	} else {
		return undef;
	}
}

sub is_defined {
	my( $class, $def_candidate ) = @_;

	if (
		$class->is_timezone( $def_candidate )
		|| $class->is_alias( $def_candidate )
	) {
		return 1;
	} else {
		return undef;
	}
}

sub is_alias {
	my( $class, $alias_candidate ) = @_;

	if ( exists $DateTime::TimeZone::LINKS{ $alias_candidate } ) {
		return 1;
	} else {
		return undef;
	}
}

sub is_timezone {
	my( $class, $tz_candidate ) = @_;

	if ( grep( /^${tz_candidate}$/, @DateTime::TimeZone::ALL ) ) {
		return 1;
	} else {
		return undef;
	}
}

sub aliases {
	my $class = shift;

	return unless defined wantarray;

	if ( wantarray ) {
		return %DateTime::TimeZone::LINKS;
	} else {
		my %dttz_links_copy = %DateTime::TimeZone::LINKS;
		return \%dttz_links_copy;
	}
}

sub timezones {
	my $class = shift;

	return unless defined wantarray;

	if ( wantarray ) {
		return @DateTime::TimeZone::ALL;
	} else {
		my @dttz_all_copy = @DateTime::TimeZone::ALL;
		return \@dttz_all_copy;
	}
}

1;

__END__
