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
        apt-utils \
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
        less \
        libnss-myhostname \
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
        whiptail \
        vim \
        ; \
    \
    rm -f /etc/ssh/*_key*; \
    systemctl disable ssh; \
    \
    update-command-not-found; \
    \
    sed -i 's/^account.*pam_nologin.so/# &/' /etc/pam.d/sshd; \
    \
    rm -f /usr/sbin/policy-rc.d

ENTRYPOINT ["/bin/systemd"]
