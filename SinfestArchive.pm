package SinfestArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Sinfest Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/sinfest.xml",
    FIRST_PAGE     => 'http://www.sinfest.net/archive_page.php?comicID=1',
    ITEMS_TO_FETCH => 5,
    RENDER         => '//p[@align="center"][count(*)=1]/img',
    NEXT_PAGE      => '//a[img[@alt="Next"]]/@href',
};


sub title {
    my ($self, $doc) = @_;
    for my $text (map $_->getValue, $doc->findnodes('//text()')) {
        if ($text =~ /^2[01]\d{2}-\d{2}-\d{2}:/) {
            return $text;
        }
    }
    return $self->SUPER::title($doc);
}


1;
