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

my $TOC_URL = 'http://xkcd.com/archive/';

sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->find('//div[@id="comic"]/img') or return;
    my $title = $img->attr('title', undef);
    return (
        $img, $title && $self->new_element('p', [ 'i', $title ])
    );
}

sub table_of_contents {
    my $self = shift;
    return $self->{toc} ||= do {
        my $toc = $self->get_doc($TOC_URL);
        return {
            map {
                $_->attr('title') =~ /^(\d+)-(\d+)-(\d+)\z/
                    ? ($toc->resolve($_->attr('href')), "$2-$3-$1")
                    : ();
            } $toc->find('//a')
        };
    };
}

sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    my $date = $self->table_of_contents->{ $doc->source };
    $title .= ' - ' . $date if defined $date;
    return $title;
}

1;
