package SMBCArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Saturday Morning Breakfast Cereal Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/smbc.xml",
    ITEMS_TO_FETCH => 3,
    FIRST_PAGE     => 'http://www.smbc-comics.com/?id=1#comic',
    RENDER         => '//div[@id="comicimage"]//img',
    NEXT_PAGE      => [ '//a[%s]/@href', 'nextRollover' ],
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my $img = $self->render($doc)) {
        if ($img->attr('src') =~ m|/comics/(\d{4})(\d{2})(\d{2})|) {
            $title .= " - $2/$3/$1";
        }
    }
    return $title;
}


1;
