# syntax=docker/dockerfile:experimental

FROM node:12.8.1

RUN \
  --mount=id=apt-cache,type=cache,target=/var/cache/apt \
  --mount=id=apt-lib,type=cache,target=/var/lib/apt \
  apt-get update --fix-missing && apt-get install -y jq
WORKDIR /downloads
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN \
  --mount=id=apt-cache,type=cache,target=/var/cache/apt \
  --mount=id=apt-lib,type=cache,target=/var/lib/apt \
  apt-get update --fix-missing && apt-get install -y -f ./google-chrome-stable_current_amd64.deb
