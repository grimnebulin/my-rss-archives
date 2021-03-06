package PennyArcadeArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Penny Arcade Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/pennyarcade.xml",
    FIRST_PAGE     => 'http://www.penny-arcade.com/comic/1998/11/18',
    ITEMS_TO_FETCH => 5,
    RENDER         => '//div[@id="comicFrame"]//img',
    NEXT_PAGE      => '//a[@title="Next"]/@href',
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    $title .= " - $2-$3-$1" if $doc->source =~ m|/comic/(\d+)/(\d+)/(\d+)|;
    return $title;
}


1;
