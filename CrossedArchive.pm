package CrossedArchive;

use HTTP::Cookies;
use parent qw(RSS::ArchiveReader);
use strict;

use constant {
    FEED_TITLE => 'Crossed Archive',
    RSS_FILE   => "$ENV{HOME}/www/rss/crossed.xml",
    FIRST_PAGE => 'http://www.crossedcomic.com/webcomic/crossed-doa-part-1/3/',
    NEXT_PAGE  => [ '//div[%s]//a[contains(.,"Next")]/@href|//div[%s]/p//a[contains(@href,"crossed-doa-part-")]/@href', 'webcomic-nav', 'entry-content' ],
    RENDER     => [ '//div[%s]//img[@width and @height]', 'entry-content' ],
    COOKIES    => 1,
    AGENT_ID   => 'Anything',
};

sub get_doc {
    my ($self, $uri) = @_;
    my $doc = $self->SUPER::get_doc($uri);
    my ($title) = $doc->find('//title');
    if ($title && $title->as_trimmed_text =~ /you are being redirected/i) {
        $self->_set_cookies($doc);
        return $self->SUPER::get_doc($uri);
    } else {
        return $doc;
    }
}

sub _set_cookies {
    my ($self, $doc) = @_;

    1 == (my ($script) = $doc->find('//script'))
        or die "Other than exactly 1 script element found";

    my $code = join "", $script->content_list;

    $self->_je->eval($code);
    die "Javascript error: $@" if $@ && $@ !~ /reload/;

    defined(my $cookie = $self->_je->{document}{cookie}) or die "No cookie found";

    my ($key, $value) = $cookie =~ /^([^=]+)=([^;]+)/ or die "Can't parse cookie";

    $self->agent->cookie_jar->set_cookie(
        '1', $key, $value, '/', $doc->source->host
    );

}

sub _je {
    my $self = shift;
    return $self->{je} ||= do {
        require JE;
        my $je = JE->new;
        $je->{document} = { };
        $je->{location} = JE::String->new($je, "");
        $je;
    }
}


1;
