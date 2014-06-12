FROM kazeburo/perl-build
MAINTAINER Masahiro Nagano <kazeburo@gmail.com>

RUN perl-build 5.18.1 /opt/perl-5.18 > /tmp/perl-install.log 2>&1
RUN rm -f /tmp/perl-install.log
RUN echo 'export PATH=/opt/perl-5.18/bin:$PATH' > /etc/profile.d/xbuild-perl.sh
ENV PATH /opt/perl-5.18/bin:${PATH}

RUN perl -v
RUN curl -s --sslv3 -L http://cpanmin.us/ | perl - --notest --no-man-pages App::cpanminus Carton Server::Starter > /tmp/cpanm-install.log 2>&1
RUN rm -f /tmp/cpanm-install.log

CMD perl -v
