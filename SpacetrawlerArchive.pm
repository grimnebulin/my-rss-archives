package SpacetrawlerArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Spacetrawler Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/spacetrawler.xml",
    FIRST_PAGE => 'http://spacetrawler.com/2010/01/01/spacetrawler-4/',
    NEXT_PAGE  => [ '//a[%s]/@href', 'navi-next' ],
};


sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->find('//div[%s]//img', 'comicpane') or return;
    my ($post) = $doc->find('//div[%s]/div[%s]', 'post-content', 'entry');
    if ($post) {
        $self->remove($post, '*[.//form[@target="paypal"]]');
        $self->truncate($post, 'div[%s]', 'really_simple');
    }
    return ($self->new_element('div', $img), $post);
}


1;
