package MegaTokyoArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'MegaTokyo Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/megatokyo.xml",
    FIRST_PAGE     => 'http://megatokyo.com/strip/1',
    ITEMS_TO_FETCH => 5,
    ITEMS_TO_KEEP  => 20,
    RENDER         => '//span[@id="strip"]//img[contains(@src,"strips/")]',
    NEXT_PAGE      => '//li[contains(concat(" ",normalize-space(@class)," ")," next ")]//a/@href',
};


sub title {
    my ($self, $tree, $uri) = @_;
    my ($title) = $tree->findnodes($self->RENDER . '/@title')
        or return $self->SUPER::title($tree, $uri);
    return $title->getValue;
}

sub next_page {
    my ($self, $tree) = @_;
    my $href = $self->SUPER::next_page($tree);
    $href =~ s|^\.(/strip/[^/]+)\z|$1|;
    return $href;
}


1;
