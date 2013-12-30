package XKCDArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'XKCD Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/xkcd.xml",
    FIRST_PAGE     => 'http://xkcd.com/1/',
    ITEMS_TO_FETCH => 3,
    NEXT_PAGE      => [ '//ul[%s]//a[@rel="next"]/@href', 'comicNav' ],
};

sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->find('//div[@id="comic"]/img') or return;
    my $title = $img->attr('title');
    return (
        $img, $title && $self->new_element('p', [ 'i', $title ])
    );
}

1;
