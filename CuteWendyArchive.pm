package CuteWendyArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Cute Wendy Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/cutewendy.xml",
    ITEMS_TO_FETCH => 3,
    FIRST_PAGE     => 'http://cutewendy.com/go/1',
    RENDER         => '//img[contains(@src,"/comics/cutewendy")]',
    NEXT_PAGE      => '//a[normalize-space()="next >"]/@href',
};

1;
