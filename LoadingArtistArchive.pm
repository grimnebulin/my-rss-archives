package LoadingArtistArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Loading Artist Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/loadingartist.xml",
    FIRST_PAGE     => 'http://www.loadingartist.com/2011/01/04/born/',
    ITEMS_TO_FETCH => 3,
    RENDER         => '//div[@id="comic"]//a/img',
    NEXT_PAGE      => '//a[@title="Next"][.="Next"]/@href',
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($href) = $doc->findnodes(RENDER . '/@src')) {
        if ($href->getValue =~ m/(\d{4})-(\d{2})-(\d{2})-/) {
            $title .= " - $2/$3/$1";
        }
    }
    return $title;
}


1;
