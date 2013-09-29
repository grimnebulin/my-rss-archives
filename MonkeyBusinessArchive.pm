package MonkeyBusinessArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Monkey Business Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/monkeybusiness.xml",
    FIRST_PAGE     => 'http://monkey-business.net/2003/08/25/nice-try-punk/',
    ITEMS_TO_FETCH => 2,
    RENDER         => '//div[contains(@class,"comicpane")]//img',
    NEXT_PAGE      => '//a[@id="comic-nav-next"]/@href',
};

1;
