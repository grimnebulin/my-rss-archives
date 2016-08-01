package LastDogArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Until the Last Dog Dies',
    RSS_FILE   => "$ENV{HOME}/www/rss/lastdog.xml",
    FIRST_PAGE => 'http://www.lastdogdies.com/comics/2192684/lesson-one-speak/',
    NEXT_PAGE  => '//a[img[starts-with(@alt,"Next ")]]/@href',
    RENDER     => '//img[@id="comic_image"]',
};

1;
