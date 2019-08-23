FROM debian:10
RUN apt-get update && apt-get install -yq gnupg2 wget lsb-release && \
wget -O - https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc | apt-key add -  && \
echo "deb http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" > /etc/apt/sources.list.d/freeswitch.list  && \
echo "deb-src http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" >> /etc/apt/sources.list.d/freeswitch.list 
# you may want to populate /etc/freeswitch at this point, or You can map volume for config to /etc/freeswitch
# if /etc/freeswitch does not exist, the standard vanilla configuration is deployed
RUN apt-get update && apt-get install -y freeswitch-meta-all
################# SPECIFIC PORTS ####################
# 5060/tcp 5060/udp 5080/tcp 5080/udp as SIP Signaling ports.
# 5061/tcp 5061/udp 5081/tcp 5081/udp  as SIPS Signaling ports
# 5066/tcp 7443/tcp as WebSocket Signaling ports.
# 8021/tcp as Event Socket port.
# 64535-65535/udp as media ports.
EXPOSE 8021/tcp
EXPOSE 5060/tcp 5060/udp 5080/tcp 5080/udp
EXPOSE 5061/tcp 5061/udp 5081/tcp 5081/udp
EXPOSE 7443/tcp
EXPOSE 5070/udp 5070/tcp
EXPOSE 64535-65535/udp
EXPOSE 16384-32768/udp

COPY /scripts/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["sh", "-c", "/usr/local/bin/docker-entrypoint.sh"]


