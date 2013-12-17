package SluggyArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Sluggy Freelance Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/sluggy.xml",
    FIRST_PAGE     => 'http://www.sluggy.com/comics/archives/daily/970825',
    ITEMS_TO_FETCH => 3,
    RENDER         => '//div[contains(@class,"comic_content")]//img[contains(@src,"/images/comics/")]',
    NEXT_PAGE      => '//div[@id="comic_navigation"]//a[normalize-space()="Next"]/@href',
};


sub title {
    my ($self, $doc) = @_;
    my ($alt) = $doc->findnodes(RENDER . '/@alt')
        or return $self->SUPER::title($doc);
    return $alt->getValue;
}


1;
