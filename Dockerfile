FROM ssiegel/base-debian-systemd
MAINTAINER Piotr Roszatycki <piotr.roszatycki@gmail.com>

ENV container=docker \
    HOME=/root \
    DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
    apt-get upgrade; \
    \
    apt-get install \
        ansible \
        aptitude \
        bash-completion \
        bzip2 \
        byobu \
        ca-certificates \
        command-not-found \
        curl \
        ckermit \
        debconf-utils \
        dnsutils \
        git \
        htop \
        links \
        lsof \
        man-db \
        manpages \
        mc \
        nano \
        net-tools \
        netcat-openbsd \
        openssh-server \
        perl \
        ppp \
        psmisc \
        pv \
        slirp \
        strace \
        sudo \
        systemd-cron \
        tcpdump \
        telnet \
        wget \
        vim \
        ; \
    \
    rm -f /etc/ssh/*_key*; \
    systemctl disable ssh; \
    \
    update-command-not-found; \
    \
    rm -f /usr/sbin/policy-rc.d

ENTRYPOINT ["/bin/systemd"]
