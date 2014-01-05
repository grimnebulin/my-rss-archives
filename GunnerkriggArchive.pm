package GunnerkriggArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Gunnerkrigg Court Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/gunnerkrigg.xml",
    FIRST_PAGE     => 'http://www.gunnerkrigg.com/?p=1',
    ITEMS_TO_FETCH => 3,
    NEXT_PAGE      => '//a[img[contains(@src,"next_a.jpg")]]/@href',
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($attr) = $doc->findnodes('//a/@title[starts-with(.,"Public on ")]')) {
        $attr = $attr->getValue;
        $attr =~ s/^Public on \s*//;
        $attr =~ s/\s*\|.*//s;
        $title .= " - $attr";
    }
    return $title;
}

sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->find('//img[%s]', 'comic_image') or return;
    my ($content) = $doc->find('//div[%s]', 'content');
    if ($content) {
        $self->remove($content, 'a[contains(@href,"mailto")]|h4|div[%s]', 'ad_spot');
    }
    return ($img, $content);
}


1;
