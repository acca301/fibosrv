FROM emc2/perl
MAINTAINER Alexander Kuznetsov acca(at)cpan.org

RUN (echo y;echo o conf prerequisites_policy follow;echo o conf commit)|cpan \
    && (echo notest install Poet::Mason)|cpan \
    && rm -rf /root/.cpan /usr/local/share/man
