package LittleDeeArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Little Dee Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/littledee.xml",
    FIRST_PAGE => 'http://www.littledee.net/archive/?week=0',
    NEXT_PAGE  => '//a[normalize-space()="Next week"]/@href',
};


sub render {
    my ($self, $doc) = @_;
    die $doc->{tree}->as_HTML;
    return map { $self->new_element('div', $_) }
           $doc->find('//ol[@id="stripList"]//img');
}


1;
