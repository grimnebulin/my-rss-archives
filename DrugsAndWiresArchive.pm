package DrugsAndWiresArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Drugs & Wires Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/drugs-n-wires.xml",
    FIRST_PAGE => 'http://www.drugsandwires.fail/dnwcomic/clean-and-sober-living/',
    NEXT_PAGE  => [ '//a[%s]/@href', 'next-webcomic-link' ],
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my ($date) = $doc->find('//div[%s]//time', 'post-details')) {
        $title = $date->as_trimmed_text . ' - ' . $title;
    }
    return $title;
}

sub render {
    my ($self, $doc) = @_;
    my ($image) = $doc->find('//div[%s]//img', 'webcomic-image') or return;
    my ($post) = $doc->find('//div[%s]', 'post-content');
    return ($image, $post);
}


1;
