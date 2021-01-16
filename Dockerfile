FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y \
    && apt install wget python3-pip ffmpeg -y \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && wget https://raw.githubusercontent.com/MoeClub/OneList/master/OneDriveUploader/amd64/linux/OneDriveUploader -P /usr/local/bin/ \
    && chmod +x /usr/local/bin/OneDriveUploader \
    && pip3 install youtube-dl \
    && cd ~ \
    && mkdir dl 
WORKDIR /root/
