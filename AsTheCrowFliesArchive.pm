package AsTheCrowFliesArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'As the Crow Flies',
    RSS_FILE   => "$ENV{HOME}/www/rss/crow.xml",
    FIRST_PAGE => 'http://www.melaniegillman.com/?p=96',
    NEXT_PAGE  => [ '//a[%s]/@href', 'navi-next' ],
    RENDER     => '//div[@id="comic"]//img',
};


1;
