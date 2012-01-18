use strict;

use Test::More;
use Webservice::InterMine;

my $do_live_tests = $ENV{RELEASE_TESTING};

unless ($do_live_tests) {
    plan( skip_all => "Acceptance tests for release testing only" );
} else {
    plan( tests => 4);
    my $service = get_service('localhost/intermine-test');
    my $obj = $service->resultset("Employee")->select("*")->where(name => "David Brent")->first(as => 'objects');

    is($obj->name, "David Brent");
    is($obj->department->name, "Sales");
    is_deeply(
        [map {$_->name} $obj->department->employees], 
        ["David Brent", "Ricky", "Rachel","Tim Canterbury", "Gareth Keenan", "Malcolm",],
        "Can fetch all members of a collection"
    );
    is($obj->department->employees_count, 6);
}

