package NimonaArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Nimona Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/nimona.xml",
    ITEMS_TO_FETCH => 3,
    FIRST_PAGE     => 'http://gingerhaze.com/nimona/comic/page-1',
    RENDER         => '//img[contains(@src,"/nimona-pages/")]',
    NEXT_PAGE      => '//a[img[contains(@src,"_next_label_")]]/@href',
};

1;

