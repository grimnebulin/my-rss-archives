package UnsoundedArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Unsounded Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/unsounded.xml",
    FIRST_PAGE => 'http://www.casualvillain.com/Unsounded/comic/ch01/ch01_01.html',
    RENDER     => '//div[@id="comic"]//img',
    NEXT_PAGE  => '//div[@id="footer"]//a[@title="forward"]/@href',
};


1;
