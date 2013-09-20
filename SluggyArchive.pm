package SluggyArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Sluggy Freelance Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/sluggy.xml",
    FIRST_PAGE     => 'http://www.sluggy.com/comics/archives/daily/970825',
    ITEMS_TO_FETCH => 5,
    RENDER         => '//div[contains(@class,"comic_content")]//img[contains(@src,"/images/comics/")]',
    NEXT_PAGE      => '//div[@id="comic_navigation"]//a[normalize-space()="Next"]/@href',
};


sub title {
    my ($self, $tree) = @_;
    my $img = $self->render($tree);
    return $img ? $img->attr('alt') : $self->SUPER::title;
}


1;
