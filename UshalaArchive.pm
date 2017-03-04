package UshalaArchive;

use HTTP::Cookies;
use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Ushala Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/ushala.xml",
    FIRST_PAGE => 'http://ushala.smackjeeves.com/comics/1692341/page-1/',
    NEXT_PAGE  => [ '//div[%s]//a[contains(.,"Next")]/@href', 'comicnav' ],
    RENDER     => '//div[@id="comic_area_inner"]//img',
    COOKIES    => [ _sj_view_m => '1' ],
};


1;
