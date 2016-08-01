package OneWayArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'One Way Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/oneway.xml",
    FIRST_PAGE => 'http://www.baldwinpage.com/onewaycomic/2013/12/30/123013-sisters-call/',
    NEXT_PAGE  => '//a[@rel="next"]/@href',
    RENDER     => [ '//div[%s]//p', 'entry-content' ],
};


1;
