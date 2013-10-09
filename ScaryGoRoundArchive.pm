package ScaryGoRoundArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Scary Go Round Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/scarygoround.xml",
    ITEMS_TO_FETCH => 5,
    FIRST_PAGE     => 'http://scarygoround.com/sgr/ar.php?date=20020604',
    RENDER         => '//img[starts-with(@src,"strips/")]',
    NEXT_PAGE      => '//a[.="Next"]/@href',
};


1;
