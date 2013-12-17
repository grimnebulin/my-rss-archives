package FalsePositiveArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'False Positive Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/falsepositive.xml",
    ITEMS_TO_FETCH => 3,
    FIRST_PAGE     => 'http://falsepositivecomic.com/2011/09/10/season-1-title-page/',
    RENDER         => '//div[@id="comic"]//a[count(*)=1]/img',
    NEXT_PAGE      => '//a[@title="Next"][contains(@class,"navi-next")]/@href',
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($href) = $doc->findnodes(RENDER . '/@src')) {
        if ($href->getValue =~ m|/comics/(\d+-\d+-\d+)|) {
            $title .= " - $1";
        }
    }
    return $title;
}


1;

