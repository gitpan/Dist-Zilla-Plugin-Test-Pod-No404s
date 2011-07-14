
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Add release tests for POD HTTP links',
  'AUTHOR' => 'Randy Stauner <rwstauner@cpan.org>',
  'BUILD_REQUIRES' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'ExtUtils::MakeMaker' => '6.30',
    'Test::More' => '0.88'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Dist-Zilla-Plugin-Test-Pod-No404s',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Dist::Zilla::Plugin::Test::Pod::No404s',
  'PREREQ_PM' => {
    'Dist::Zilla::Plugin::InlineFiles' => '0',
    'Moose' => '0',
    'Test::Pod::No404s' => '0.01'
  },
  'VERSION' => '1.001',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



