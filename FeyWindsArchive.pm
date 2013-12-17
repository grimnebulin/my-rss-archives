package FeyWindsArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Fey Winds Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/feywinds.xml",
    FIRST_PAGE     => 'http://www.feywinds.com/comic/page.php?id=0',
    ITEMS_TO_FETCH => 3,
    RENDER         => '//img[contains(@src,"/comic/pages/")]',
    NEXT_PAGE      => '//a[img[contains(@src,"navnext")]]/@href',
};

1;
