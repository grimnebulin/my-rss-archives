package BrunoArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Bruno Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/bruno.xml",
    FIRST_PAGE => 'http://www.baldwinpage.com/jan196.html',
    RENDER     => '//img[1]',
    NEXT_PAGE  => '//table//a[1]/@href',
};

1;
