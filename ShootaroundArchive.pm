package ShootaroundArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Shootaround Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/shootaround.xml",
    FIRST_PAGE => 'http://www.webtoons.com/en/comedy/shoot-around/ep-1/viewer?title_no=399&episode_no=1',
    NEXT_PAGE  => '//a[@title="Next Episode"]/@href',
};


sub render {
    my ($self, $doc) = @_;
    my @img = $doc->find('//div[@id="_imageList"]//img');
    for my $img (grep defined $_->attr('data-url'), @img) {
        $img->attr('src', $img->attr('data-url'))
    }
    return @img;
}


1;
