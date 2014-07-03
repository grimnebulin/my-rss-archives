package HelveticaArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Helvetica Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/helvetica.xml",
    FIRST_PAGE => 'http://helvetica.jnwiedle.com/2011/06/24/and-so-it-begins/',
    NEXT_PAGE  => [ '//div[%s]/a[@rel="next"]/@href', 'nav-next' ],
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($date) = $doc->find('//span[%s]', 'post-date')) {
        $title .= ' - ' . $date->as_trimmed_text;
    }
    return $title;
}

sub render {
    my ($self, $doc) = @_;
    my ($image) = $doc->find('//div[%s]//img', 'comicpane') or return;
    my ($post) = $doc->find('//div[%s]', 'entry');
    return ($image, $post);
}


1;
