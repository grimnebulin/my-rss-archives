package MesaVerdeTimes;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Mesa Verde Times',
    RSS_FILE   => "$ENV{HOME}/www/rss/mesaverde.xml",
    FIRST_PAGE => 'http://mesaverdetimes.blogspot.com/2009/03/10-years-gone.html',
    NEXT_PAGE  => '//span[@id="blog-pager-newer-link"]//a/@href',
    RENDER     => [ '//div[starts-with(@id,"post-body-") and %s]', 'post-body' ],
};


1;
