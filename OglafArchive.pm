package OglafArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Oglaf Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/oglaf.xml",
    FIRST_PAGE     => 'http://oglaf.com/cumsprite/',
    ITEMS_TO_FETCH => 5,
    NEXT_PAGE      => '//a[@rel="next"]/@href',
    END_OF_ARCHIVE_NOTIFY => 0,
};


sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->findnodes('//img[@id="strip"]') or return;
    my $title = $img->attr('title');
    my $alt   = $img->attr('alt');
    return (
        $img,
        $title && $self->new_element('div', [ 'i', $title ]),
        $alt   && $self->new_element('div', [ 'i', $alt   ]),
    );
}


1;
