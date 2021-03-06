package MegaTokyoArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'MegaTokyo Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/megatokyo.xml",
    FIRST_PAGE     => 'http://megatokyo.com/strip/1',
    ITEMS_TO_FETCH => 5,
    RENDER         => '//span[@id="strip"]//img[contains(@src,"strips/")]',
    NEXT_PAGE      => '//li[contains(concat(" ",normalize-space(@class)," ")," next ")]//a/@href',
};


sub title {
    my ($self, $doc) = @_;
    my ($title) = $doc->findnodes($self->RENDER . '/@title')
        or return $self->SUPER::title($doc);
    return $title->getValue;
}


1;
