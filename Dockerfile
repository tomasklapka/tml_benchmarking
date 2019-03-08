FROM debian:buster-slim

ENV TAU_COMMIT 5b304bc9
ADD souffle_1.5.1-1_amd64.deb /tmp/souffle.deb
ADD XSB.tar.gz /opt

# install required packages and souffle package
RUN apt-get update && apt-get install -yq --no-install-recommends ca-certificates libgomp1 libncurses5 libsqlite3-0 \
 mcpp g++ git zlib1g-dev libffi-dev libsqlite3-dev libncurses5-dev make time bc procps \
 && dpkg -i /tmp/souffle.deb

# clone tau repo and compile
RUN git clone "https://github.com/IDNI/tau" /tmp/tau \
 && cd /tmp/tau \
 && git reset --hard $TAU_COMMIT \
 && make \
 && mv ./tml /usr/bin/ \
 && rm -rf /tmp/tau

# configure and make XSB
RUN cd /opt/XSB/build \
 && ./configure \
 && ./makexsb \
 && echo -n "#!/bin/sh\n\n/opt/XSB/bin/xsb \$@\n" > /usr/bin/xsb \
 && chmod +x /usr/bin/xsb

WORKDIR /home/tests
VOLUME /home/tests

# run tests
ENTRYPOINT ["/home/tests/test.sh"]
