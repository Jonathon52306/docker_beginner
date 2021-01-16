FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8
RUN apt update && apt upgrade -y \
    && apt install wget python3-pip ffmpeg screen language-pack-zh-hans language-pack-zh-hans-base -y \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && wget https://raw.githubusercontent.com/MoeClub/OneList/master/OneDriveUploader/amd64/linux/OneDriveUploader -P /usr/local/bin/ \
    && wget https://getfrp.sh/d/frpc_linux_amd64 -P /usr/local/bin/frpc \
    && chmod +x /usr/local/bin/OneDriveUploader \
    && chmod +x /usr/local/bin/frpc \
    && pip3 install youtube-dl \
    && cd ~ \
    && mkdir dl 
WORKDIR /root/
CMD [ "frpc -f kz5t3ielrgq78p1x:742098" ]
EXPOSE 22