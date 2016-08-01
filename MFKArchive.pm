package MFKArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'MFK Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/mfk.xml",
    FIRST_PAGE => 'http://www.mfkcomic.com/comic/chapter-1-page-1-2/',
    NEXT_PAGE  => [ '//a[%s]/@href', 'navi-next' ],
    RENDER     => '//div[@id="comic"]//img',
};

sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->find('//div[@id="comic"]//img') or return;
    my ($entry) = $doc->find('//div[%s]', 'entry');
    return ($img, $entry);
}


1;
