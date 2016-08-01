package HarpyGeeArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Harpy Gee',
    RSS_FILE   => "$ENV{HOME}/www/rss/harpygee.xml",
    FIRST_PAGE => 'http://www.harpygee.com/comic/cover',
    NEXT_PAGE  => '//a[@rel="next"]/@href',
    RENDER     => '//img[@id="cc-comic"]',
};


1;
