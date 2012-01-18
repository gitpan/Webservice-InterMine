package Webservice::InterMine::Model;

=head1 NAME

Webservice::InterMine::Model - A version of an InterMine Model that is aware that it comes from a web service

=head1 DESCRIPTION

This model provides lazy fetching support from its originating web service.

=cut

use parent qw(InterMine::Model);

use Scalar::Util qw/weaken/;

sub set_service {
    my $self = shift;
    my $service = shift;
    $self->{service} = $service;
    weaken($self->{service});
    return $self->{service};
}

sub lazy_fetch {
    my $self = shift;
    my ($cd, $fd, $obj) = @_;
    my $q = $self->{service}
                 ->resultset($cd)
                 ->select("id", $fd->name . ".*")
                 ->where(id => $obj->id)
                 ->outerjoin($fd->name);
    my $r = $q->first(as => 'objects');
    my $reader = "get" . ucfirst($fd->name);
    my $ref = $r->$reader;
    return $ref;
}

1;

