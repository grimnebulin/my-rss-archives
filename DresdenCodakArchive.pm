package DresdenCodakArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Dresden Codak Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/dresden.xml",
    FIRST_PAGE     => 'http://dresdencodak.com/2005/06/08/the-tomorrow-man/',
    RENDER         => '//div[@id="comic"]//img',
    NEXT_PAGE      => '//div[contains(@class,"menunav")]//a[img[contains(@src,"m_next")]]/@href',
};


1;
