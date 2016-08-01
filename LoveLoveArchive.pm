package LoveLoveArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Love! Love! Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/lovelove.xml",
    FIRST_PAGE     => 'http://www.s-morishitastudio.com/comic/ch1-1-3/',
    NEXT_PAGE      => [ '//a[%s]/@href', 'navi-next' ],
};


sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->find('//div[@id="comic"]//img') or return;
    my ($entry) = $doc->find('//div[%s]', 'entry-content');
    $self->remove($entry, './/*[%s or %s]', 'googlepublisherpluginad', 'sharedaddy') if $entry;
    return ($img, $entry);
}


1;
