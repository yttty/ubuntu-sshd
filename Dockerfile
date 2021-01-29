FROM ubuntu:20.04
LABEL Tim Yang "https://github.com/yttty/ubuntu-sshd"

ENV ROOT_PASSWORD=root \
    KEYPAIR_LOGIN=false

ADD entrypoint.sh /

# Change mirror
RUN sed -i 's/archive.ubuntu.com/opentuna.cn/g' /etc/apt/sources.list \
    && sed -i 's/security.ubuntu.com/opentuna.cn/g' /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y openssh-server \
    && chmod a+x /entrypoint.sh \
    && mkdir -p /var/run/sshd \
    && mkdir -p /root/.ssh \
    && rm -f /etc/ssh/ssh_host_*_key /etc/ssh/ssh_host_*_key.pub

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

EXPOSE 22
VOLUME ["/etc/ssh"]
ENTRYPOINT ["/entrypoint.sh"]
