package NamesakeArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Namesake Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/namesake.xml",
    FIRST_PAGE     => 'http://namesakecomic.com/comic/prologue-cover-3/',
    ITEMS_TO_FETCH => 3,
    RENDER         => '//div[@id="comic"]//img',
    NEXT_PAGE      => '//td[contains(@class,"comic_navi_right")]//a/@href',
};

1;
