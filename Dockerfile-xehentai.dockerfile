FROM ubuntu:18.04
WORKDIR /root/
RUN apt update && apt upgrade -y \
    && apt install python3-pip npm git -y \
    && npm install -g n \
    && n latest \
    && pip3 install -U requests[socks] \
    && git clone https://github.com/fffonion/xeHentai.git /root/xeHentai \
    && cd /root/xeHentai \
    && python3 ./setup.py install \
    && xeH --rpc-port=8010 \
    && git clone https://github.com/fffonion/xeHentai-webui.git /root/xeHentai-webui \
    && cd /root/xeHentai-webui \
    && npm install \
    && npm run dev
EXPOSE 8080