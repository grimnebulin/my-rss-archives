package NadiaGreeneArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Nadia Greene Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/nadiagreene.xml",
    FIRST_PAGE => 'http://immortalnadia.tumblr.com/post/128114169495/chapter-1-cover',
    NEXT_PAGE  => [ '//nav[%s]/a[%s]/@href', 'comic-pagination', 'next-button' ],
    RENDER     => [ '//figure[%s]//img', 'photo-hires-item' ],
};


1;
