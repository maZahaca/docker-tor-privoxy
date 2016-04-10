FROM ubuntu:14.04
MAINTAINER Spencer Herzberg <spencer.herzberg@gmail.com>

RUN apt-get update -qq && apt-get install privoxy -y

# Ports
EXPOSE 8118

# Add custom config
ADD ./privoxy/config /etc/privoxy/config

RUN echo "forward-socks4a / ${TOR_PROXY}:9050 ." >> /etc/privoxy/config

CMD ["privoxy", "--no-daemon", "/etc/privoxy/config"]

