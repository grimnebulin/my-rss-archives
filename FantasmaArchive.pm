package FantasmaArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Fantasma Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/fantasma.xml",
    FIRST_PAGE => 'http://fantasmacomic.net/comic/page-1/',
    NEXT_PAGE  => [ '//a[%s]/@href', 'comic-nav-next' ],
};


sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->find('//div[@id="comic"]//img');
    my ($entry) = $doc->find('//div[%s]', 'entry');
    return ($img, $entry);
}


1;
