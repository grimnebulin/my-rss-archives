package ALILArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'A Lesson',
    RSS_FILE   => "$ENV{HOME}/www/rss/alil.xml",
    FIRST_PAGE => 'http://www.alessonislearned.com/index.php?comic=1',
    NEXT_PAGE  => '//a[img[contains(@src,"navi_next")]]/@href',
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($date) = $doc->find('//span[%s]', 'comicdate')) {
        $title .= ' - ' . $date->as_trimmed_text;
    }
    return $title;
}

sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->find('//img[starts-with(@src,"cmx/lesson")]')
        or return;
    my @content = $doc->find(
        '//table[not(.//table)]//td[%s]/following-sibling::td/*',
        'bigcaption01'
    );
    return ($img, @content);
}


1;
