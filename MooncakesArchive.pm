package MooncakesArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Mooncakes',
    RSS_FILE   => "$ENV{HOME}/www/rss/mooncakes.xml",
    FIRST_PAGE => 'http://mooncakescomic.tumblr.com/post/130986680250',
    NEXT_PAGE  => [ '//a[%s]/@href', 'next-button' ],
    RENDER     => '//figure[contains(@class,"hires")]//a//img',
};


sub title {
    my ($self, $doc) = @_;
    my ($date) = $doc->find('//li[%s]', 'timestamp');
    return defined $date ? $date->as_trimmed_text : $self->SUPER::title($doc);
}


1;
