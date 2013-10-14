package MonkeyBusinessArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Monkey Business Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/monkeybusiness.xml",
    FIRST_PAGE     => 'http://monkey-business.net/2003/08/25/nice-try-punk/',
    ITEMS_TO_FETCH => 3,
    RENDER         => '//div[contains(@class,"comicpane")]//img',
    NEXT_PAGE      => '//a[@id="comic-nav-next"]/@href',
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($date) = $doc->findnodes('//div[contains(@class,"post-date")]')) {
        $title .= ' - ' . $date->as_trimmed_text;
    }
    return $title;
}


1;
