package NamesakeArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Namesake Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/namesake.xml",
    FIRST_PAGE     => 'http://namesakecomic.com/comic/prologue-cover-3/',
    ITEMS_TO_FETCH => 3,
    RENDER         => '//div[@id="comic"]//img',
    NEXT_PAGE      => [ '//td[%s]//a/@href', 'comic_navi_right' ],
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my $img = $self->render($doc)) {
        $title .= " - $1" if $img->attr('src') =~ m|/(\d{4}-\d{2}-\d{2})-|;
    }
    return $title;
}


1;
