package ScalaNeophyteArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Scala Neophyte',
    RSS_FILE   => "$ENV{HOME}/www/rss/scalaneo.xml",
    FIRST_PAGE => 'http://danielwestheide.com/blog/2012/11/21/the-neophytes-guide-to-scala-part-1-extractors.html',
    RENDER     => [ '//div[%s]', 'entry-content' ],
    NEXT_PAGE  => '//a[starts-with(@title,"Next Post")]/@href',
};

1;
