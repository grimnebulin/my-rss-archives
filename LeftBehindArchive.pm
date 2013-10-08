package LeftBehindArchive;

use URI;
use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Left Behind Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/lbarc.xml",
    FIRST_PAGE => 'http://www.patheos.com/blogs/slacktivist/2008/11/07/lb-rapture-ready/',
    RENDER     => '//div[contains(@class,"entry-content")]',
};


sub get_page {
    my ($self, $uri) = @_;
    for (1 .. 5) {
        my $response = eval { $self->SUPER::get_page($uri) };
        return $response if $response;
        die $@ if $@ !~ /Bad hostname/;
        # print STDERR "Trying again!\n";
    }
    return;
}

sub next_page {
    my ($self, $tree, $uri) = @_;

    do {
        my ($href) = $tree->findnodes('//a[@rel="next"]/@href');
        $uri = $href && $self->resolve($href->getValue, $tree, $uri);
        $tree = $uri && $self->get_tree($uri->clone);
    } while $tree && 0 == $tree->findnodes('//span[contains(@class,"categories")]//a[@rel="category tag"][contains(@title,"Left Behind")]')->size;

    return $uri;

}

1;
