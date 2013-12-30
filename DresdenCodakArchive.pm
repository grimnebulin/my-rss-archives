package DresdenCodakArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Dresden Codak Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/dresden.xml",
    FIRST_PAGE     => 'http://dresdencodak.com/2005/06/08/the-tomorrow-man/',
    RENDER         => '//div[@id="comic"]//img',
    NEXT_PAGE      => [ '//div[%s]//a[img[contains(@src,"m_next")]]/@href', 'menunav' ],
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    $title .= " - $1-$2-$3" if $doc->source =~ m|/(\d{4})/(\d{2})/(\d{2})/|;
    return $title;
}


1;
