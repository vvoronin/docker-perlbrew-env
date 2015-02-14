FROM ubuntu

RUN apt-get update
RUN apt-get install -y --force-yes wget build-essential
ENV PERLBREW_ROOT=/perl5

RUN bash -c '\wget -O - http://install.perlbrew.pl | bash'
RUN /perl5/bin/perlbrew init
RUN /perl5/bin/perlbrew install -j 4 perl-5.20.1
RUN /perl5/bin/perlbrew install-cpanm
RUN /perl5/bin/perlbrew switch perl-5.20.1
ENV PERLBREW_ROOT=/perl5
ENV PATH=/perl5/bin:/perl5/perls/perl-5.20.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PERLBREW_PERL=perl-5.20.1
ENV PERLBREW_VERSION=0.73
ENV PERLBREW_MANPATH=/perl5/perls/perl-5.20.1/man
ENV PERLBREW_PATH=/perl5/bin:/perl5/perls/perl-5.20.1/bin
ENV PERLBREW_SKIP_INIT=1
RUN cpanm -n Catalyst::Devel
