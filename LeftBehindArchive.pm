package LeftBehindArchive;

use URI;
use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Left Behind Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/lbarc.xml",
    FIRST_PAGE => 'http://www.patheos.com/blogs/slacktivist/2008/11/07/lb-rapture-ready/',
};

my $CATEGORY_IS_LB = '//span[contains(@class,"categories")]//' .
                     'a[@rel="category tag"][contains(@title,"Left Behind")]';


sub new {
    my $class = shift;
    return $class->SUPER::new(agent => LeftBehindArchive::Agent->new);
}

sub render {
    my ($self, $doc) = @_;
    my ($div) = $doc->findnodes('//div[contains(@class,"entry-content")]')
        or return;
    $_->detach for $div->find_by_tag_name('br');
    return $div;
}

sub next_page {
    my ($self, $doc) = @_;
    my $uri;

    do {
        my ($link) = $doc->findnodes('//a[@rel="next"]');
        $uri = $link && $link->attr_absolute('href');
        $doc = $uri && $self->get_doc($uri);
    } while $doc && 0 == $doc->findnodes($CATEGORY_IS_LB)->size;

    return $uri;

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
