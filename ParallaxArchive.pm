package ParallaxArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Parallax Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/parallax.xml",
    FIRST_PAGE => 'http://www.parallaxcomic.com/comic/page-01',
    NEXT_PAGE  => [ '//div[%s]//a[@rel="next"]/@href', 'nav' ],
    RENDER     => '//img[starts-with(@title,"Page ")]',
};

1;
