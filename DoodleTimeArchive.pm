package DoodleTimeArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Doodle Time Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/doodletime.xml",
    ITEMS_TO_FETCH => 3,
    FIRST_PAGE     => 'http://sarahseeandersen.tumblr.com/post/54188692300',
    NEXT_PAGE      => '//a[.="Next"]/@href',
    FILTER         => '/html/head/meta[@name="keywords"]' .
                      '[contains(@content,"comic")]',
};


sub render {
    my ($self, $doc) = @_;
    my ($img) = $doc->findnodes('//a[contains(@href,"/image/")]/img')
        or return;
    my $alt = $img->attr('alt', undef);
    return ($img, $alt && $self->new_element('p', [ 'i', $alt ]));
}


1;
