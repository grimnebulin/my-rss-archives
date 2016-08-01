package PrincessLovePonArchive;

use parent qw(RSS::ArchiveReader);
use strict;
use utf8;

use constant {
    FEED_TITLE => 'Princess Love♡Pon',
    RSS_FILE   => "$ENV{HOME}/www/rss/princesslovepon.xml",
    FIRST_PAGE => 'http://princesslovepon.com/post/115094558688/and-our-story-begins',
    NEXT_PAGE  => [ '//nav[%s]/a[%s]/@href', 'comic-pagination', 'next-button' ],
    RENDER     => [ '//figure[%s]//img', 'photo-hires-item' ],
};


1;
