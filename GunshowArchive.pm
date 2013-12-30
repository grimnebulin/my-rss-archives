package GunshowArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Gunshow Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/gunshow.xml",
    FIRST_PAGE     => 'http://gunshowcomic.com/1',
    ITEMS_TO_FETCH => 3,
    RENDER         => [ '//div[@id="comic"]/img[%s]', 'strip' ],
    NEXT_PAGE      => '//a[img[contains(@src,"next.gif")]]/@href',
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my $img = $self->render($doc)) {
        if ($img->attr('src') =~ m|/comics/(\d\d\d\d)(\d\d)(\d\d)\b|) {
            $title .= " - $2/$3/$1";
        }
    }
    return $title;
}


1;
