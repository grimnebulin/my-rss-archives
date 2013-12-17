package JudeccaArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Judecca Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/judecca.xml",
    FIRST_PAGE     => 'http://judecca.co.uk/comic/1/',
    ITEMS_TO_FETCH => 3,
    NEXT_PAGE      => '//a[contains(@class,"navi-next")]/@href',
};


sub render {
    my ($self, $doc) = @_;

    my ($img) = $doc->findnodes(
        '//div[@id="comic"]//img[contains(@src,"/uploads/")]'
    ) or return;

    my @content = ($img);

    if (my ($post) = $doc->findnodes('//div[contains(@class,"post-content")]')){
        push @content, $post;
        $_->detach for $post->findnodes('div[.//iframe]');
    }

    return @content;

}


1;
