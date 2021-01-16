FROM ubuntu:18.04
SHELL [ "/bin/bash","-c" ]
ENTRYPOINT [ "/bin/bash" ,"-c"]
WORKDIR /root/
RUN apt update && apt upgrade -y \
    && apt install default-jre curl figlet wget ruby zip unzip -y \
    && wget https://github.com/busyloop/lolcat/archive/master.zip \
    && unzip master.zip \
    && cd lolcat-master/bin \
    && gem install lolcat \
    && echo 'echo "Hello Jonathan"|figlet|lolcat -a -d 1' >> /root/.bashrc \