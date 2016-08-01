package DarknessArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'When the Darkness Presses',
    RSS_FILE => "$ENV{HOME}/www/rss/darkness.xml",
    FIRST_PAGE => 'http://emcarroll.com/comics/darkness/one.html',
    RENDER => '//img[preceding-sibling::img[contains(@src,"leftgif")] and following-sibling::img[contains(@src,"rightgif")]]',
    NEXT_PAGE => '//a[img[contains(@src,"nextbutton")]]/@href',
};


1;
