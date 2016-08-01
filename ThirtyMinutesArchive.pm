package ThirtyMinutesArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => '30 Minutes to Live',
    RSS_FILE   => "$ENV{HOME}/www/rss/30minutes.xml",
    FIRST_PAGE => 'http://30minutestolive.com/',
    NEXT_PAGE  => '//a[@title="Next Page"]/@href',
};

sub render {
    my ($self, $doc) = @_;
    return grep { $_->attr('title') =~ /\b(title|page \d+)\z/ } $doc->find('//img');
}


1;
