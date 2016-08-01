package BlindspringsArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Blindsprings Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/blindsprings.xml",
    FIRST_PAGE => 'http://www.blindsprings.com/comic/blindsprings-cover-book-one',
    NEXT_PAGE  => '//a[@rel="next"]/@href',
    RENDER     => '//div[@id="cc-comicbody"]//img',
};


1;
