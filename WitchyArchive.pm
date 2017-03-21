package WitchyArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Witchy Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/witchy.xml",
    FIRST_PAGE => 'http://witchycomic.com/comic/page-1/',
    NEXT_PAGE  => [ '//a[%s]/@href', 'comic-nav-next' ],
};


sub render {
    my ($self, $doc) = @_;
    my ($image) = $doc->find('//div[@id="comic"]//img') or return;
    my ($entry) = $doc->find('//div[%s]', 'entry');
    return ($image, $entry);
}


1;
