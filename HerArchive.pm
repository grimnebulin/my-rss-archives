package HerArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Her Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/her.xml",
    FIRST_PAGE     => 'http://www.girlvspig.com/archives/her1.html',
    ITEMS_TO_FETCH => 3,
    RENDER         => '//div[@id="strip"]',
    NEXT_PAGE      => '//a[img[@alt="NEXT"]]/@href',
};


1;
