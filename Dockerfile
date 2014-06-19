FROM kazeburo/perl-build
MAINTAINER Masahiro Nagano <kazeburo@gmail.com>

ENV BUILD_PERL_VER 5.20
ENV BUILD_PERL_REL 0

RUN perl-build -DDEBUGGING=-g $BUILD_PERL_VER.$BUILD_PERL_REL /opt/perl-$BUILD_PERL_VER > /tmp/perl-install.log 2>&1
RUN rm -f /tmp/perl-install.log
RUN echo "export PATH=/opt/perl-$BUILD_PERL_VER/bin:\$PATH" > /etc/profile.d/perl-build.sh

# install cpanm,carton and start_server
RUN curl -s --sslv3 -L http://cpanmin.us/ | /opt/perl-$BUILD_PERL_VER/bin/perl - --notest App::cpanminus Carton Server::Starter

CMD perl -v
