FROM ubuntu:18.04
SHELL [ "/bin/bash","-c" ]
ENTRYPOINT [ "/bin/bash" ,"-c"]
WORKDIR /root/
RUN sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && sed -i 's/http:\/\/security.ubuntu.com/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt update && apt upgrade -y \
    && apt install default-jre curl figlet wget ruby zip unzip -y \
    && wget https://github.com/busyloop/lolcat/archive/master.zip \
    && unzip master.zip \
    && cd lolcat-master/bin \
    && gem install lolcat \
    && echo 'echo "Hello Jonathan"|figlet|lolcat -a -d 1' >> /root/.bashrc \