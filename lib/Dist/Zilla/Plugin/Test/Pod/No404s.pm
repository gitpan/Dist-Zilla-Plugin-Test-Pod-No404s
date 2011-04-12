# vim: set ts=2 sts=2 sw=2 expandtab smarttab:
#
# This file is part of Dist-Zilla-Plugin-Test-Pod-No404s
#
# This software is copyright (c) 2011 by Randy Stauner.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
package Dist::Zilla::Plugin::Test::Pod::No404s;
BEGIN {
  $Dist::Zilla::Plugin::Test::Pod::No404s::VERSION = '1.000';
}
BEGIN {
  $Dist::Zilla::Plugin::Test::Pod::No404s::AUTHORITY = 'cpan:RWSTAUNER';
}
# ABSTRACT: Add release tests for POD HTTP links

use strict;
use warnings;
use Moose;
extends 'Dist::Zilla::Plugin::InlineFiles';

__PACKAGE__->meta->make_immutable;
no Moose;

1;




=pod

=for :stopwords Randy Stauner cpan testmatrix url annocpan anno bugtracker rt cpants
kwalitee diff irc mailto metadata placeholders

=head1 NAME

Dist::Zilla::Plugin::Test::Pod::No404s - Add release tests for POD HTTP links

=head1 VERSION

version 1.000

=head1 SYNOPSIS

  # dist.ini
  [Test::Pod::No404s]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>
providing the following files:

  xt/release/pod-no404s.t - a standard Test::Pod::No404s test

You can skip the test by setting
C<$ENV{SKIP_POD_NO404S}>
or
C<$ENV{AUTOMATED_TESTING}>.

I elected to skip the 404 test with C<AUTOMATED_TESTING>
because I don't want to run that test (and bother the network) often,
but I do like to run my author and release tests
before actually attempting C<dzil release>.

So using C<dzil smoke> instead of C<dzil test>
will skip the 404 network tests.

=head1 SEE ALSO

=over 4

=item *

L<Test::Pod::No404s>

=back

=head1 SUPPORT

=head2 Perldoc

You can find documentation for this module with the perldoc command.

  perldoc Dist::Zilla::Plugin::Test::Pod::No404s

=head2 Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

=over 4

=item *

Search CPAN

L<http://search.cpan.org/dist/Dist-Zilla-Plugin-Test-Pod-No404s>

=item *

RT: CPAN's Bug Tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Dist-Zilla-Plugin-Test-Pod-No404s>

=item *

AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Dist-Zilla-Plugin-Test-Pod-No404s>

=item *

CPAN Ratings

L<http://cpanratings.perl.org/d/Dist-Zilla-Plugin-Test-Pod-No404s>

=item *

CPAN Forum

L<http://cpanforum.com/dist/Dist-Zilla-Plugin-Test-Pod-No404s>

=item *

CPANTS Kwalitee

L<http://cpants.perl.org/dist/overview/Dist-Zilla-Plugin-Test-Pod-No404s>

=item *

CPAN Testers Results

L<http://cpantesters.org/distro/D/Dist-Zilla-Plugin-Test-Pod-No404s.html>

=item *

CPAN Testers Matrix

L<http://matrix.cpantesters.org/?dist=Dist-Zilla-Plugin-Test-Pod-No404s>

=back

=head2 Bugs / Feature Requests

Please report any bugs or feature requests by email to C<bug-dist-zilla-plugin-test-pod-no404s at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Dist-Zilla-Plugin-Test-Pod-No404s>. You will be automatically notified of any
progress on the request by the system.

=head2 Source Code


L<http://github.com/magnificent-tears/Dist-Zilla-Plugin-Test-Pod-No404s/tree>

  git clone git://github.com/magnificent-tears/Dist-Zilla-Plugin-Test-Pod-No404s.git

=head1 AUTHOR

Randy Stauner <rwstauner@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Randy Stauner.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__DATA__
___[ xt/release/pod-no404s.t ]___
#!perl

use strict;
use warnings;
use Test::More;

foreach my $env_skip ( qw(
  SKIP_POD_NO404S
  AUTOMATED_TESTING
) ){
  plan skip_all => "\$ENV{$env_skip} is set, skipping"
    if $ENV{$env_skip};
}

eval "use Test::Pod::No404s";
if ( $@ ) {
  plan skip_all => 'Test::Pod::No404s required for testing POD';
}
else {
  all_pod_files_ok();
}
