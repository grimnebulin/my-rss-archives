package FantomeSteinArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Famtome-Stein Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/fantomestein.xml",
    FIRST_PAGE => 'http://fantome-stein.tumblr.com/post/123858798184/chapter-1-cover-its-alliveee-lightning',
    NEXT_PAGE  => [ '//a[%s]/@href', 'next-button' ],
    RENDER     => [ '//figure[%s]//a[contains(@href,"fantome-stein.tumblr.com/image/")]//img', 'photo-hires-item' ],
};

1;



