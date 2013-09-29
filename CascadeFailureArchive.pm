package CascadeFailureArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Cascade Failure Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/cascade-failure.xml",
    FIRST_PAGE     => 'http://cascadefailure.comicgenesis.com/d/20020311.html',
    ITEMS_TO_FETCH => 3,
    RENDER         => '//img[contains(@src,"/comics/")][@alt="Comic"]',
    NEXT_PAGE      => '//a[img[starts-with(@alt,"Next")]]/@href',
};

1;
