package SubstitutesArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Substitutes Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/substitutes.xml",
    FIRST_PAGE => 'http://thesubstitutescomic.com/post/128622828246/prologue-page-1-next-page-last-page',
    NEXT_PAGE  => [ '//nav[%s]/a[%s]/@href', 'comic-pagination', 'next-button' ],
    RENDER     => [ '//figure[%s]//img', 'photo-hires-item' ],
    ITEMS_TO_FETCH => 3,
};

sub title {
    my ($self, $doc) = @_;
    my ($caption) = $doc->find('//div[%s]/p', 'caption');
    return $caption ? $caption->as_trimmed_text : $self->SUPER::title($doc);
}


1;
