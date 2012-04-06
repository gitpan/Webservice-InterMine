use strict;
no warnings 'deprecated';

use Test::More;
use Webservice::InterMine;

$SIG{__WARN__} = sub {}; # Silence all warnings

my $do_live_tests = $ENV{RELEASE_TESTING};

use constant URL => "localhost/intermine-test";

unless ($do_live_tests) {
    plan( skip_all => "Acceptance tests for release testing only" );
} else {
    plan( tests => 5 );

    my $token_service = get_service( URL, "test-user-token" );
    my $user_1    = $token_service->user;
    is $user_1->token, "test-user-token";
    is $user_1->name,  "intermine-test-user";

    my $password_service = get_service( URL, "intermine-test-user", "intermine-test-user-password" );
    my $user_2    = $password_service->user;
    ok   $user_2->token;
    isnt $user_2->token, "test-user-token";
    is   $user_2->name,  "intermine-test-user";

}
