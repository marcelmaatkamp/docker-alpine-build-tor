FROM marcelmaatkamp/alpine-build-base

ENV VERSION 0.2.7.6
EXPOSE 9001 9050
RUN curl https://dist.torproject.org/tor-${VERSION}.tar.gz | tar xz

RUN cd tor-${VERSION} && ./configure
RUN cd tor-${VERSION} && make
RUN cd tor-${VERSION} && make install
RUN cd tor-${VERSION} && make clean
RUN cd tor-${VERSION} && make dist-gzip
