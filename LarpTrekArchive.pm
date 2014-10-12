package LarpTrekArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Larp Trek Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/larptrek.xml",
    FIRST_PAGE => 'http://larptrek.com/larptrek/1/',
    RENDER     => [ '//div[%s]/img', 'webcomic-image' ],
    NEXT_PAGE  => [ '//a[@rel="next"][%s]/@href', 'next-webcomic-link' ],
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($date) = $doc->find('//a[@rel="bookmark"]/time')) {
        $title .= ' | ' . $date->as_trimmed_text;
    }
    return $title;
}


1;
