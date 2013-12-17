package XKCDArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'XKCD Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/xkcd.xml",
    FIRST_PAGE     => 'http://xkcd.com/1/',
    ITEMS_TO_FETCH => 3,
    NEXT_PAGE      => '//ul[contains(@class,"comicNav")]//a[@rel="next"]/@href',
};

sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->findnodes('//div[@id="comic"]/img') or return;
    my $title = $img->attr('title');
    return (
        $img, $title && $self->new_element('p', [ 'i', $title ])
    );
}

1;
