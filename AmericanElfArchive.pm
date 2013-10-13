package AmericanElfArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'American Elf Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/americanelf.xml",
    FIRST_PAGE     => 'http://www.americanelf.com/comics/americanelf.php?view=single&ID=40945',
    ITEMS_TO_FETCH => 5,
    RENDER         => '//img[contains(@src,"/~americanelf/comics/archival/")]',
    NEXT_PAGE      => '//a[img/@src[substring(.,string-length()-8)="/next.gif"]]/@href',
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($img) = $self->render($doc)) {
        $title .= " - $1" if $img->attr('src') =~ m|/(\d+-\d+-\d+)|;
    }
    return $title;
}


1;
