package YellowHeartsArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Yellow Hearts Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/yellowhearts.xml",
    FIRST_PAGE => 'http://yellowheartscomic.tumblr.com/page/52',
    RENDER     => [ '//article[%s]//img', 'post' ],
    NEXT_PAGE  => '//nav[@id="pagination"]//a[img[contains(@src,"cg4kw8.png")]]/@href',
};


1;
