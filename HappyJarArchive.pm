package HappyJarArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Happy Jar Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/happyjar.xml",
    ITEMS_TO_FETCH => 3,
    FIRST_PAGE     => 'http://www.happyjar.com/comic/broken-math/',
    RENDER         => '//div[@id="comic"]/img',
    NEXT_PAGE      => [ '//a[%s]/@href', 'navi-next' ],
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($div) = $doc->find('//div[%s]', 'postinfo')) {
        my $date = $div->as_trimmed_text;
        $date =~ s/^Posted +//;
        $date =~ s/ +by .*//;
        $title .= ' - ' . $date;
    }
    return $title;
}


1;
