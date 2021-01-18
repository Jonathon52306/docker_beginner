FROM ubuntu:18.04
RUN sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && sed -i 's/http:\/\/security.ubuntu.com/http:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt update && apt upgrade -y \
    && apt install python3-pip npm git wget curl -y \
    && npm install -g n \
    && npm config set registry https://registry.npm.taobao.org \
    && npm install -g cnpm \
    && n latest \
    && pip3 install -U requests[socks] \
    && git clone https://github.com/fffonion/xeHentai.git /root/xeHentai \
    && cd /root/xeHentai \
    && python3 ./setup.py install \
    && echo "xeH --rpc-port=8010" >>~/.bashrc \
    && git clone https://github.com/fffonion/xeHentai-webui.git /root/xeHentai-webui \
    && cd /root/xeHentai-webui \
    && cnpm install \
    && echo "npm run dev &">>/root/.bashrc
WORKDIR /root/xeHentai-webui
EXPOSE 8080
