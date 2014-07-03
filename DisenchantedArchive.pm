package DisenchantedArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Disenchanted Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/disenchanted.xml",
    FIRST_PAGE => 'http://www.disenchantedcomic.com/webcomic/1/',
    RENDER     => '//div[@id="webcomic-art"]//img',
    NEXT_PAGE  => '//div[@id="webcomic-right"]/a[last()]/@href',
    ITEMS_TO_FETCH => 3,
};

1;
