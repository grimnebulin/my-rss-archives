package DilbertArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Dilbert Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/dilbert-archive.xml",
    FIRST_PAGE     => 'http://dilbert.com/strip/2015-02-18',
    ITEMS_TO_FETCH => 10,
    NEXT_PAGE      => '//a[@alt="Newer Strip"]/@href',
    END_OF_ARCHIVE_NOTIFY => 0,
};


sub render {
    my ($self, $doc) = @_;
    return $doc->find('//div[%s]//img', 'img-comic-container');
}


1;
