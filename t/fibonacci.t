#!/usr/bin/env perl
use Test::More tests => 20;
use Test::Mojo;

use FindBin;
require "$FindBin::Bin/../fibonacci";

my $t = Test::Mojo->new;

$t->get_ok('/')
  ->status_is(404);

$t->get_ok('/broken')
  ->status_is(400);

$t->get_ok('/-1')
  ->status_is(400);

$t->get_ok('/0')
  ->status_is(200)
  ->json_is('/0' => undef)
  ->content_is('[]');

$t->get_ok('/1')
  ->status_is(200)
  ->json_is('/0' => 0)
  ->json_hasnt('/1');

$t->get_ok('/2')
  ->content_is('[0,1]');

$t->get_ok('/3')
  ->content_is('[0,1,1]');

$t->get_ok('/20')
  ->content_is('[0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181]');

exit;
