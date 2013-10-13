package MrWigglesArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Mr. Wiggles Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/mrwiggles.xml",
    FIRST_PAGE     => 'http://www.mrwiggleslovesyou.com/archive/1/',
    ITEMS_TO_FETCH => 5,
    RENDER         => '//span[contains(@class,"webcomic")]/img[contains(@src,"/webcomic/rehab")]',
    NEXT_PAGE      => '//a[contains(@class,"next-webcomic-link")]/@href',
};

1;
