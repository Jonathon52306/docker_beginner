FROM ubuntu
SHELL [ "/bin/bash","-c" ]
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && sed -i 's/http:\/\/security.ubuntu.com/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt update && apt upgrade -y \
    # && unminimize -y \
    && apt update && apt install language-pack-zh-hans language-pack-zh-hans-base gnome wget -y \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt update && apt install xfce4 xrdp \
    tightvncserver xfce4-terminal -y \
    && echo “xfce4-session” >~/.xsession \
    && service xrdp restart \
    && wget https://getfrp.sh/d/frpc_linux_amd64 -P /usr/local/bin/ \
    && mv /usr/local/bin/frpc_linux_amd64 /usr/local/bin/frpc \
    && chmod +x /usr/local/bin/frpc \
    && echo 'nohup frpc -f kz5t3ielrgq78p1x:707297 > frpc.out 2>&1 &' >> ~/.bashrc 