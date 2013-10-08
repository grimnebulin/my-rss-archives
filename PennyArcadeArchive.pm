package PennyArcadeArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Penny Arcade Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/pennyarcade.xml",
    FIRST_PAGE     => 'http://www.penny-arcade.com/comic/1998/11/18',
    ITEMS_TO_FETCH => 5,
    ITEMS_TO_KEEP  => 20,
    RENDER         => '//div[contains(@class,"comic")]/img',
    NEXT_PAGE      => '//a[@title="Next"]/@href',
};


sub title {
    my ($self, $tree, $uri) = @_;
    my $title = $self->SUPER::title($tree, $uri);
    $title .= " - $2-$3-$1" if $uri =~ m|/comic/(\d+)/(\d+)/(\d+)|;
    return $title;
}


1;