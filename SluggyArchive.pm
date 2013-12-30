package SluggyArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Sluggy Freelance Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/sluggy.xml",
    FIRST_PAGE     => 'http://www.sluggy.com/comics/archives/daily/970825',
    ITEMS_TO_FETCH => 3,
    RENDER         => [ '//div[%s]', 'comic_content' ],
    NEXT_PAGE      => '//div[@id="comic_navigation"]//a[normalize-space()="Next"]/@href',
};


sub title {
    my ($self, $doc) = @_;
    if (my $div = $self->render($doc)) {
        if (my ($alt) = $self->find($div, './/img/@alt')) {
            return $alt->getValue;
        }
    }
    return $self->SUPER::title($doc);
}


1;
