package PrincessPlanetArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Princess Planet Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/princessplanet.xml",
    ITEMS_TO_FETCH => 3,
    FIRST_PAGE     => 'http://www.theprincessplanet.com/2004/11/13/welcome-to-the-princess-planet/',
    NEXT_PAGE      => [ '//div[%s]/a[@rel="next"]/@href', 'nav' ],
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($date) = $doc->find('//div[%s]', 'comicdate')) {
        $title .= ' - ' . $date->as_trimmed_text;
    }
    return $title;
}

sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->findnodes('//div[@id="comic"]/img') or return;
    my @comment = $doc->findnodes(
        '//div[%s]/*[not(self::script)]' .
        '[not(@*[starts-with(local-name(),"data-")])]',
        'entry'
    );
    return ($self->new_element('div', $img), @comment);
}


1;
