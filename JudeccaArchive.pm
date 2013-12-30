package JudeccaArchive;

use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE     => 'Judecca Archive',
    RSS_FILE       => "$ENV{HOME}/www/rss/judecca.xml",
    FIRST_PAGE     => 'http://judecca.co.uk/comic/1/',
    ITEMS_TO_FETCH => 3,
    NEXT_PAGE      => [ '//a[%s]/@href', 'navi-next' ],
};


sub title {
    my ($self, $doc) = @_;
    my $title = $self->SUPER::title($doc);
    if (my $post = _post($doc)) {
        if ($post->as_trimmed_text =~ /\bon.(\w+ \d+, \d+)/) {
            $title .= " - $1";
        }
    }
    return $title;
}

sub render {
    my ($self, $doc) = @_;

    my ($img) = $doc->find(
        '//div[@id="comic"]//img[contains(@src,"/uploads/")]'
    ) or return;

    my @content = ($img);

    if (my $post = _post($doc)) {
        $self->remove($post, '//*[self::iframe or self::script]');
        push @content, $post;
    }

    return @content;

}

sub _post {
    my $doc = shift;
    my ($post) = $doc->find('//div[%s]', 'post-content') or return;
    return $post;
}


1;
