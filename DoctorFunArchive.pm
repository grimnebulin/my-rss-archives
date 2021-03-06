package DoctorFunArchive;

use URI;
use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Doctor Fun Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/doctorfun.xml",
    FIRST_PAGE => 'http://www.ibiblio.org/Dave/ar00001.htm',
    NEXT_PAGE  => '//a[starts-with(normalize-space(),"next")]/@href',
};


sub render {
    my ($self, $doc) = @_;
    return map {
        $self->new_element(
            'div', [ 'img', { src => $doc->resolve($_->attr('href')) } ]
        )
    } $doc->findnodes('//a[img[contains(@src,"/thumbs/")]]');
}


1;
