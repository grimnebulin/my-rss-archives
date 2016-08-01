package NarniaDeconstruction;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Narnia Deconstruction',
    RSS_FILE   => "$ENV{HOME}/www/rss/narnia.xml",
    FIRST_PAGE => 'http://www.anamardoll.com/2011/06/narnia-stifling-role-of-child-mother.html',
    NEXT_PAGE  => '//a[@title="Newer Post"]/@href',
    RENDER     => [ '//div[%s]', 'post-body' ],
};


sub filter {
    my ($self, $doc) = @_;
    return $doc->source =~ m#/(narnia|dawn-treader)#;
}


1;
