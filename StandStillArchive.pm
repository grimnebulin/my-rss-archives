package StandStillArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Stand Still Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/standstill.xml",
    FIRST_PAGE => 'http://www.sssscomic.com/comic.php?page=1',
    NEXT_PAGE  => '//a[div[@id="navnext"]]/@href',
    RENDER     => '//img[starts-with(@src,"comicpages/")]',
};


1;
