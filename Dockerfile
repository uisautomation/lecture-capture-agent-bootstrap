FROM ubuntu:16.04

RUN apt-get -y update && \
  apt-get -y install p7zip-full cpio gzip genisoimage whois pwgen wget \
    fakeroot isolinux dos2unix patch mkisofs syslinux-utils xorriso

VOLUME /images

WORKDIR /workspace
ADD ./ubuntu/ /workspace/ubuntu/
ADD ./entrypoint.sh /workspace
ADD ./deploy-keys.pub /workspace

ENV VERSION=16.04 IMAGE_NAME=lc-agent
ENTRYPOINT ["./entrypoint.sh"]

# vim:sw=2:ts=2:et:sts=2
