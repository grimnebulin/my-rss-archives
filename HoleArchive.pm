package HoleArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'The Hole',
    RSS_FILE   => "$ENV{HOME}/www/rss/hole.xml",
    FIRST_PAGE => 'http://www.emcarroll.com/comics/fox/',
    NEXT_PAGE  => '//a[img[contains(@src,"arrowforward")]]/@href',
};

sub render {
    my ($self, $doc) = @_;
    return grep { $_->attr('src') =~ m|/comics/fox/\d+\.jpg\z| } $doc->find('//img');
}


1;
