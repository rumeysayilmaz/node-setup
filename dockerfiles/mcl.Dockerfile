FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y 

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN apt-get install unzip libgomp1 -y

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /root/marmara && mkdir /root/marmara/src
RUN cd root/marmara/src && wget https://github.com/marmarachain/marmara/releases/download/v1.1.6/MCL-linux.zip && unzip MCL-linux.zip && chmod +x komodod komodo-cli fetch-params.sh

COPY run_mcl ./root/
RUN chmod +x /root/run_mcl

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]

