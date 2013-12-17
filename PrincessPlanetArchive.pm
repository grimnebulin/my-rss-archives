package PrincessPlanetArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Princess Planet Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/princessplanet.xml",
    ITEMS_TO_FETCH => 3,
    FIRST_PAGE     => 'http://www.theprincessplanet.com/2004/11/13/welcome-to-the-princess-planet/',
    RENDER         => '//div[@id="comic"]/img',
    NEXT_PAGE      => '//div[contains(@class,"nav")]/a[@rel="next"]/@href',
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($date) = $doc->findnodes('//div[contains(@class,"comicdate")]')) {
        $title .= ' - ' . $date->as_trimmed_text;
    }
    return $title;
}


1;
