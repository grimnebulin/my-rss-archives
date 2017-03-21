package AnnaGalacticArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Anna Galactic',
    RSS_FILE   => "$ENV{HOME}/www/rss/annagalactic.xml",
    FIRST_PAGE => 'https://www.baldwinpage.com/annagalactic/2015/01/28/43/',
    NEXT_PAGE  => '//a[@rel="next"]/@href',
};


sub render {
    my ($self, $doc) = @_;
    my ($image) = $doc->find('//div[%s]/p[1]', 'entry-content') or return;
    my @text = $self->find($image, 'following-sibling::p');
    return ($image, @text);
}


1;
