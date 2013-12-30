package DepressionComixArchive;

use base qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Depression Comix Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/depression.xml",
    ITEMS_TO_FETCH => 3,
    FIRST_PAGE     => 'http://depressioncomix.tumblr.com/post/10012388094/depression-comix-1-nav-1-2',
    RENDER         => [ '//div[%s]//img', 'photo_holder' ],
    NEXT_PAGE      => [ '//div[%s]//strong/following-sibling::a[1]/@href',
                        'caption' ],
};

1;
