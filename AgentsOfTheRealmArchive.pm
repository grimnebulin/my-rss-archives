package AgentsOfTheRealmArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Agents of the Realm Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/agents.xml",
    FIRST_PAGE => 'http://www.agentsoftherealm.com/aotr/-volume-1-',
    NEXT_PAGE  => '//a[@rel="next"]/@href',
    RENDER     => '//div[@id="cc-comicbody"]//img',
};


1;
