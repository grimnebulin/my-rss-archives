package AchewoodArchive;

use parent qw(RSS::ArchiveReader);
use strict;
use utf8;

use constant {
    FEED_TITLE       => 'Achewood Archive',
    RSS_FILE         => "$ENV{HOME}/www/rss/achewood-archive.xml",
    FIRST_PAGE       => 'http://achewood.com/index.php?date=10012001',
    ITEMS_TO_FETCH   => 10,
    ITEMS_TO_KEEP    => 40,
    NEXT_PAGE        => '//a[normalize-space()="»"]/@href',
};


sub render {
    my ($self, $tree) = @_;
    my ($image) = $tree->findnodes('//img[contains(@class,"comic")]') or die;
    my $title   = $image->attr('title', undef);
    return $self->new_element(
        'div', $image, $title ? [ 'div', [ 'i', $title ] ] : (),
    );
}


1;
