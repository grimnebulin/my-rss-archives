package FormalSweatpantsArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Formal Sweatpants Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/formalsweatpants.xml",
    # FIRST_PAGE     => 'http://formalsweatpants.com/iceberg/',
    FIRST_PAGE     => 'http://formalsweatpants.com/comic/cartooning/',
    ITEMS_TO_FETCH => 3,
    RENDER         => '//div[@id="comic"]//img',
    NEXT_PAGE      => [ '//td[%s]//a[@title="Next"]/@href', 'comic_navi_right' ],
};

1;
