FROM debian:buster-slim

ADD souffle_1.5.1-1_amd64.deb /tmp/souffle.deb
ADD XSB.tar.gz /opt

# install required packages and souffle package
RUN apt-get update && apt-get install -yq --no-install-recommends \
 libgomp1 libncurses5 libsqlite3-0 zlib1g-dev libffi-dev libsqlite3-dev libncurses5-dev \
 ca-certificates git mcpp g++ make time bc procps nodejs npm \
 && dpkg -i /tmp/souffle.deb

# configure and make XSB
RUN cd /opt/XSB/build \
 && ./configure \
 && ./makexsb \
 && echo -n "#!/bin/sh\n\n/opt/XSB/bin/xsb \$@\n" > /usr/bin/xsb \
 && chmod +x /usr/bin/xsb

# clone tml.js repo and build
RUN git clone "https://github.com/tomasklapka/tml.js" /home/tml.js \
 && cd /home/tml.js \
 && npm install \
 && npm run-script build_npm \
 && echo "#!/bin/bash\n\ndeclare -a meminfo=(\$(free --kilo | grep Mem))\ndeclare -i max_mem=\${meminfo[1]}" > /usr/bin/tml.js \
 && echo "max_mem=\$max_mem/1024\nnode --max_old_space_size=\$max_mem /home/tml.js/cli \$@" >> /usr/bin/tml.js \
 && chmod +x /usr/bin/tml.js

# clone tau repo and compile
ENV TAU_COMMIT 50c2883
RUN git clone "https://github.com/IDNI/tau" /tmp/tau \
 && cd /tmp/tau \
 && git reset --hard $TAU_COMMIT \
 && g++ -std=c++1y tml.cpp driver.cpp bdd.cpp -W -Wall -Wpedantic -o/usr/bin/tml -O3 -flto \
 && rm -rf /tmp/tau

WORKDIR /home/tests
VOLUME /home/tests

# run tests
ENTRYPOINT ["/home/tests/test.sh"]
