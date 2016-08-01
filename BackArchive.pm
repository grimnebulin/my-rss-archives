package BackArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Back Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/back.xml",
    FIRST_PAGE => 'http://backcomic.com/1',
    NEXT_PAGE  => '//a[img[contains(@src,"next")]]/@href',
    RENDER     => '//div[@id="comic"]//img',
};

1;
