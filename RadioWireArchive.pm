package RadioWireArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Radio Wire Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/radiowire.xml",
    FIRST_PAGE     => 'http://www.ep.tc/radio-wire/issue-one/index.html',
    ITEMS_TO_FETCH => 5,
    RENDER         => '//img[@width="85%"]',
    NEXT_PAGE      => '//img[@width="85%"]/parent::a/@href',
};


1;

