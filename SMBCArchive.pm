package SMBCArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Saturday Morning Breakfast Cereal Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/smbc.xml",
    FIRST_PAGE => 'http://www.smbc-comics.com/?id=1#comic',
    RENDER     => '//div[@id="comicimage"]//img',
    NEXT_PAGE  => '//a[contains(@class,"nextRollover")]/@href',
};

1;
