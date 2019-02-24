FROM ubuntu:18.04
LABEL Terrill Yang "https://github.com/yttty"

ENV ROOT_PASSWORD=root \
    KEYPAIR_LOGIN=false

ADD entrypoint.sh /

RUN apt-get install -y openssh-server \
    && chmod a+x /entrypoint.sh \
    && mkdir -p /var/run/sshd \
    && mkdir -p /root/.ssh \
    && rm -f /etc/ssh/ssh_host_*_key /etc/ssh/ssh_host_*_key.pub

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

EXPOSE 22
VOLUME ["/etc/ssh"]
ENTRYPOINT ["/entrypoint.sh"]
