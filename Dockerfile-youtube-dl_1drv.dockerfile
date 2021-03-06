FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && sed -i 's/http:\/\/security.ubuntu.com/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt update && apt upgrade -y \
    && apt install wget python3-pip ffmpeg screen language-pack-zh-hans language-pack-zh-hans-base openssh-server -y \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && wget https://raw.githubusercontent.com/MoeClub/OneList/master/OneDriveUploader/amd64/linux/OneDriveUploader -P /usr/local/bin/ \
    && wget https://getfrp.sh/d/frpc_linux_amd64 -P /usr/local/bin/ \
    && mv /usr/local/bin/frpc_linux_amd64 /usr/local/bin/frpc \
    && chmod +x /usr/local/bin/OneDriveUploader \
    && chmod +x /usr/local/bin/frpc \
    && pip3 install youtube-dl \
    && cd ~ \
    && mkdir dl 
WORKDIR /root/