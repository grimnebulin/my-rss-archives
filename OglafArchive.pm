package OglafArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Oglaf Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/oglaf.xml",
    FIRST_PAGE     => 'http://oglaf.com/cumsprite/',
    ITEMS_TO_FETCH => 5,
    NEXT_PAGE      => '//a[div[@id="nx"]]/@href',
};


sub get_page {
    my ($self, $uri) = @_;
    return $self->agent->post($uri, { over18 => 'y' });
}

sub render {
    my ($self, $tree) = @_;
    my ($img) = $tree->findnodes('//img[@id="strip"]') or return;
    my $title = $img->attr('title');
    my $alt   = $img->attr('alt');
    return (
        $img,
        $title && $self->new_element('div', [ 'i', $title ]),
        $alt   && $self->new_element('div', [ 'i', $alt   ]),
    );
}


1;