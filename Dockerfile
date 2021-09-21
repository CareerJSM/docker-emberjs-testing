# syntax=docker/dockerfile:experimental

FROM node:12.22.5-stretch

RUN \
  --mount=id=apt-cache,type=cache,target=/var/cache/apt \
  --mount=id=apt-lib,type=cache,target=/var/lib/apt \
  apt-get update -qqy && \
  apt-get -qqy install xvfb fluxbox x11vnc dbus  \
  fontconfig \
  curl \
  python-dev \
  gnupg wget ca-certificates apt-transport-https && \
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
  apt-get update -qqy && \
  apt-get -qqy install google-chrome-unstable && \
  ln -s /usr/bin/nodejs /usr/bin/node && \
  npm install bower ember-cli -g && \
  rm -rf /var/lib/apt/lists/* && \
  git clone https://github.com/facebook/watchman.git && \
  cd watchman && \
  git checkout v4.9.0 && \
  ./autogen.sh && \
  ./configure && \
  make && \
  make install

COPY entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
