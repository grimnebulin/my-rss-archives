package LovecraftArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Lovecraft Is Missing Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/lovecraft.xml",
    FIRST_PAGE => 'http://lovecraftismissing.com/?p=930',
    NEXT_PAGE  => [ '//div[%s]/a[@rel="next"]/@href', 'nav' ],
};


sub title {
    my ($self, $page) = @_;
    my $title = $self->SUPER::title($page);
    if (my ($date) = $page->find('//div[%s]', 'comicdate')) {
        $date = $date->clone;
        $self->remove($date, '*');
        $title .= ' - ' . $date->as_trimmed_text;
    }
    return $title;
}

sub render {
    my ($self, $page) = @_;

    my @img = $page->find(
        '//div[@id="comic"]/img[@src[string-length()>0]]' .
        '[not(preceding-sibling::br)]'
    ) or return;

    return map { $self->new_element('div', $_) } @img;

}


1;
