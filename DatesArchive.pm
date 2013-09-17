package DatesArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => '28 Dates Later',
    RSS_FILE   => "$ENV{HOME}/www/rss/28dates.xml",
    FIRST_PAGE => 'http://28dateslater.blogspot.co.uk/2013/01/date-one-love-bites.html',
    NEXT_PAGE  => '//div[@id="blog-pager"]//a[contains(.,"Newer")]/@href',
    RENDER     => '//div[contains(@class,"post-body")]',
};

1;
