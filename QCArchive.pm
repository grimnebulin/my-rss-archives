package QCArchive;

use parent qw(RSS::ArchiveReader);
use strict;
use utf8;

use constant {
    FEED_TITLE     => 'Questionable Content Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/qcarchive.xml",
    FIRST_PAGE     => 'http://questionablecontent.net/view.php?comic=1',
    ITEMS_TO_FETCH => 10,
    NEXT_PAGE      => '//a[normalize-space()="Next"]/@href',
};


sub render {
    my ($self, $doc) = @_;
    my ($image) = $doc->findnodes('//div[@id="comic"]//img[contains(@src,"/comics/")]')
        or return;
    my ($news) = $doc->findnodes('//div[@id="news"]');
    $news = "" if $news && $news->as_trimmed_text =~ /no news today, sorry/i;
    return ($image, $news);
}


1;
