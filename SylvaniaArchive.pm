package SylvaniaArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Sylvania Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/sylvania.xml",
    FIRST_PAGE => 'http://sylvaniacomic.com/page-001/',
    RENDER     => [ '//div[%s]//img', 'feature-img' ],
    NEXT_PAGE  => '//a[@rel="next"]/@href',
};


1;
