FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y openvpn

ENV VPN_USERNAME your_username
ENV VPN_PASSWORD your_password
ENV Location your_location

MKDIR configs
CD configs
WGET https://configs.ipvanish.com/configs/configs.zip
unzip configs.zip

RUN echo "$VPN_USERNAME\n$VPN_PASSWORD" > /etc/openvpn/auth.txt

RUN openvpn --config $Location --auth-user-pass /etc/openvpn/auth.txt