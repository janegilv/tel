use lib qw(lib);
use Test::More;
plan tests => 11;
use_ok('App::Tel');
use_ok('App::Tel::HostRange');
use_ok('App::Tel::Passwd');
use_ok('App::Tel::Passwd::Base');
use_ok('App::Tel::Passwd::KeePass');
use_ok('App::Tel::Passwd::PWSafe');
use_ok('App::Tel::Color');
use_ok('App::Tel::Color::Base');
use_ok('App::Tel::Color::Cisco');
use_ok('App::Tel::Color::CiscoPingRainbow');
use_ok('App::Tel::Color::CiscoLog');

