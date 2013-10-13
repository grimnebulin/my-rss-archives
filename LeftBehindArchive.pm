package LeftBehindArchive;

use URI;
use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Left Behind Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/lbarc.xml",
    FIRST_PAGE => 'http://www.patheos.com/blogs/slacktivist/2008/11/07/lb-rapture-ready/',
};


sub get_page {
    my ($self, $uri) = @_;
    for (1 .. 5) {
        my $response = eval { $self->SUPER::get_page($uri) };
        return $response if $response;
        die $@ if $@ !~ /Bad hostname/;
    }
    return;
}

sub render {
    my ($self, $doc) = @_;
    my ($div) = $doc->findnodes('//div[contains(@class,"entry-content")]')
        or return;
    $_->detach for $div->findnodes('.//br');
    return $div;
}

sub next_page {
    my ($self, $doc) = @_;
    my $uri;

    do {
        my ($link) = $doc->findnodes('//a[@rel="next"]');
        $uri = $link && $link->attr_absolute('href');
        $doc = $uri && $self->get_doc($uri);
    } while $doc && 0 == $doc->findnodes('//span[contains(@class,"categories")]//a[@rel="category tag"][contains(@title,"Left Behind")]')->size;

    return $uri;

}

1;
