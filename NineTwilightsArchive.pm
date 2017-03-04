package NineTwilightsArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Nine Twilights Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/ninetwilights.xml",
    FIRST_PAGE => 'http://www.ninetwilights.com/cover/',
    RENDER     => [ '//img[%s]', 'size-full'],
    NEXT_PAGE  => '//a[@rel="next"]/@href',
};


1;
