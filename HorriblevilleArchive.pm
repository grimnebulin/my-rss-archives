package HorriblevilleArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Horribleville Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/horribleville.xml",
    FIRST_PAGE     => 'http://horribleville.com/d/20051220.html',
    ITEMS_TO_FETCH => 3,
    RENDER         => '//img[@id="comic"]',
    NEXT_PAGE      => '//a[img[contains(@src,"next.png")]]/@href',
};

sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($src) = $doc->findnodes(RENDER . '/@src')) {
        if ($src->getValue =~ m|/comics/(\d\d\d\d)(\d\d)(\d\d)\b|) {
            $title .= " - $2/$3/$1";
        }
    }
    return $title;
}

1;
