#!/usr/local/bin/perl -w
use Tk;
use lib './blib/lib'; use Tk::Splashscreen;
use Tk::widgets qw/Photo Animation/;
use strict;

my $mw = MainWindow->new;
$mw->withdraw;
$mw->Button(-text => 'Quit', -command => \&exit)->pack;


my $splash = $mw->Splashscreen(-milliseconds => 5000);

my $animate;
my $gif89 = Tk->findINC('anim.gif');
$animate = $splash->Animation(-format => 'gif', -file => $gif89);
$splash->Label(-image => $animate)->pack;
$animate->set_image(0);
$animate->start_animation(500);

$splash->Splash;		# show Splashscreen

$mw->after(1000);
$| = 1;
print STDOUT "Waiting for Splashscreen to finish ...\n";

$splash->Destroy;		# tear down Splashscreen

$mw->deiconify;			# show calculator
 
MainLoop;
