package SpacetrawlerArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Spacetrawler Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/spacetrawler.xml",
    FIRST_PAGE => 'http://spacetrawler.com/2010/01/01/spacetrawler-4/',
    NEXT_PAGE  => '//a[contains(@class,"navi-next")]/@href',
};


sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->findnodes('//div[contains(@class,"comicpane")]//img')
        or return;
    my ($post) = $doc->findnodes('//div[contains(@class,"post-content")]/div[contains(@class,"entry")]');
    if ($post) {
        $_->detach for $post->findnodes('*[.//form[@target="paypal"]]');
        if (my ($break) = $post->findnodes('div[contains(@class,"really_simple")]')) {
            $break->parent->splice_content($break->pindex);
        }
    }
    return ($self->new_element('div', $img), $post);
}


1;
