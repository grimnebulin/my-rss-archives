package CascadeFailureArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Cascade Failure Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/cascade-failure2.xml",
    FIRST_PAGE     => 'http://cascadefailure.comicgenesis.com/d/20020311.html',
    ITEMS_TO_FETCH => 3,
    NEXT_PAGE      => '//a[img[starts-with(@alt,"Next")]]/@href',
    CACHE_DIR      => "$ENV{HOME}/www/cc/cascade",
    CACHE_URL  => 'http://seanmcafee.name/cc/cascade',
};


sub render {
    my ($self, $doc) = @_;
    return map $self->new_element('div', $_),
           map $self->cache_image($doc, $_),
        $doc->findnodes('//img[contains(@src,"/comics/")][@alt="Comic"]');
}


1;
