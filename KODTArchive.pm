package KODTArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'KODT Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/kodt.xml",
    FIRST_PAGE     => 'http://www.kodtweb.com/2011/05/16/hello-world/',
    ITEMS_TO_FETCH => 5,
    NEXT_PAGE      => [ '//td[%s]/a[%s]/@href', 'comic_navi_right', 'navi-next' ],
};


sub render {
    my ($self, $doc) = @_;
    my @img = $doc->find('//div[%s]/img', 'comicpane') or return;
    my ($entry) = $doc->find('//div[%s]//div[%s]', 'post', 'entry');
    return (@img, $entry);
}


1;

