package LeftBehindArchive;

use URI;
use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Left Behind Archive',
    RSS_FILE => "$ENV{HOME}/www/rss/lbarc.xml",
    FIRST_PAGE => 'http://www.patheos.com/blogs/slacktivist/2008/11/07/lb-rapture-ready/',
    RENDER => '//div[contains(@class,"entry-content")]',
    NEXT_PAGE => '//a[@rel="next"]/@href',
    FILTER => '//span[contains(@class,"categories")]//' .
              'a[@rel="category tag"][contains(@title,"Left Behind")]',
};


sub new {
    return shift->SUPER::new(
        agent => LeftBehindArchive::Agent->new(agent => "")
    );
}

{

package LeftBehindArchive::Agent;

use parent qw(LWP::UserAgent);

my $ATTEMPTS = 5;

sub request {
    my ($self, @args) = @_;
    for my $attempt (1 .. $ATTEMPTS) {
        my $response = eval { $self->SUPER::request(@args) };
        return $response if $response;
        die $@ if $@ !~ /Bad hostname/;
    }
    die "Failed to download $args[0] after $ATTEMPTS attempts\n";
}

}

1;
