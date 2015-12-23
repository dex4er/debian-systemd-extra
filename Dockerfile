FROM ssiegel/base-debian-systemd
MAINTAINER Piotr Roszatycki <piotr.roszatycki@gmail.com>

ENV container=docker \
    HOME=/root \
    DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
    apt-get upgrade; \
    \
    echo "locales locales/locales_to_be_generated multiselect pl_PL.UTF-8 UTF-8" | debconf-set-selections; \
    echo "locales locales/default_environment_locale select pl_PL.UTF-8" | debconf-set-selections; \
    dpkg-reconfigure locales; \
    \
    echo "Europe/Warsaw" > /etc/timezone; \
    dpkg-reconfigure tzdata; \
    \
    apt-get install command-not-found; \
    update-command-not-found; \
    \
    apt-get install \
        ansible \
        aptitude \
        bash-completion \
        bzip2 \
        byobu \
        ca-certificates \
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
    rm -f /usr/sbin/policy-rc.d

ENTRYPOINT ["/bin/systemd"]
