package DemonArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Demon Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/demon.xml",
    FIRST_PAGE => 'http://www.shigabooks.com/?page=001',
    NEXT_PAGE  => '//a[img[@name="nextRol"]]/@href',
    ITEMS_TO_FETCH => 3,
    RENDER     => '//img[contains(@src,"wordpress/comics/")]',
};


1;
