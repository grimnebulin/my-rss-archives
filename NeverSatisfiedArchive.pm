package NeverSatisfiedArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Never Satisfied Archive',
    RSS_FILE => "$ENV{HOME}/www/rss/neversatisfied.xml",
    FIRST_PAGE => 'http://www.neversatisfiedcomic.com/comic/chapter-1-chirp-chirp-chirp',
    NEXT_PAGE => [ '//div[%s]//a[@rel="next"]/@href', 'nav' ],
};

sub render {
    my ($self, $doc) = @_;
    my ($image) = $doc->find('//img[@id="cc-comic"]') or return;
    my ($title) = $image->attr('title');
    return ($image, '<br>', $self->new_element('i', $title));
}

1;
