package OOTSArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'OOTS Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/oots.xml",
    ITEMS_TO_FETCH => 5,
    FIRST_PAGE     => 'http://www.giantitp.com/comics/oots0001.html',
    RENDER         => '//img[contains(@src,"/comics/images/")]',
    NEXT_PAGE      => '//a[img[@title="Next Comic"]]/@href',
};

my $TOC_URL = 'http://www.giantitp.com/comics/oots.html';


sub table_of_contents {
    my $self = shift;
    return $self->{toc} ||= do {
        my $toc = $self->get_doc($TOC_URL);
        return {
            map {
                $toc->resolve($_->attr('href')) => $_->as_trimmed_text
            } $toc->find('//p[%s]/a', 'ComicList')
        };
    };
}

sub title {
    my ($self, $doc) = @_;
    return $self->table_of_contents->{ $doc->source }
        || $self->SUPER::title($doc);
}


1;

