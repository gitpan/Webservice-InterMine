package Webservice::InterMine::User;

=head1 NAME

Webservice::InterMine::User - a tiny representation of an InterMine user account.

=head1 SYNOPSIS

  use Webservice::InterMine::User;

  my $user = Webservice::InterMine::User->new(name => "foo", token => "bar");

=head1 DESCRIPTION

This is a datatype for abstracting information about users. It contains two read-only
fields "name" and "token". Normally these should be obtained from a service object.

=cut

use Moose;

has [qw/name token/] => (is => 'ro',isa => 'Str');

__PACKAGE__->meta->make_immutable;
no Moose;

1;

__END__

=head1 AUTHOR

Alex Kalderimis C<dev@intermine.org>

=head1 BUGS

Please report any bugs or feature requests to C<dev@intermine.org>.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Webservice::InterMine::User

You can also look for information at:

=over 4

=item * InterMine

L<http://www.intermine.org>

=item * Documentation

L<http://intermine.org/wiki/PerlWebServiceAPI>

=back

=head1 COPYRIGHT AND LICENSE

Copyright 2006 - 2011 FlyMine, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
