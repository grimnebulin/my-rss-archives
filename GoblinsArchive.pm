package GoblinsArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Goblins Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/goblins.xml",
    FIRST_PAGE     => 'http://www.goblinscomic.org/06262005/',
    ITEMS_TO_FETCH => 5,
    RENDER         => '//div[@id="comic"]//img',
    NEXT_PAGE      => '//div[@class="nav-next"]/a[@rel="next"]/@href',
};

1;
