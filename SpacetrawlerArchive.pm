package SpacetrawlerArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Spacetrawler Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/spacetrawler.xml",
    FIRST_PAGE => 'http://spacetrawler.com/2010/01/01/spacetrawler-4/',
    RENDER     => '//div[contains(@class,"comicpane")]//img',
    NEXT_PAGE  => '//a[contains(@class,"navi-next")]/@href',
};

1;
