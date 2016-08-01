package EmoKidArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Emo Kid Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/emokid.xml",
    FIRST_PAGE => 'http://www.cheerupemokid.com/comic/truth',
    NEXT_PAGE  => '//a[@title="Next Strip"]/@href',
    RENDER     => '//',
    ITEMS_TO_FETCH => 3,
};

sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    my ($date) = $doc->find('//article//time');
    return defined($date) ? "$title - " . $date->as_trimmed_text : $title;
}

sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->find('//div[@id="comic"]/img') or return;
    return (
        $img,
        $self->new_element(
            'div', { style => 'font-style: italic' }, $img->attr('title')
        )
    );
}


1;
