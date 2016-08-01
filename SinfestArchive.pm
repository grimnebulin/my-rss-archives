package SinfestArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Sinfest Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/sinfest.xml",
    FIRST_PAGE     => 'http://sinfest.net/view.php?date=2000-01-17',
    ITEMS_TO_FETCH => 5,
    RENDER         => '//img[contains(@src,"/comics/")]',
    NEXT_PAGE      => '//a[img[contains(@src,"/next.gif")]]/@href',
    AGENT_ID       => 'Anything',
};


sub title {
    my ($self, $doc) = @_;
    for my $td ($doc->findnodes('//td')) {
        my $text = $td->as_trimmed_text;
        if ($text =~ /^(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)/) {
            return $text;
        }
    }
    return $self->SUPER::title($doc);
}


1;
