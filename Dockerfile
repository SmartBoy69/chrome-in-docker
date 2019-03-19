FROM debian:buster-slim

RUN mkdir -p /home/chromeuser && \
    useradd chromeuser && \    
    chown chromeuser:chromeuser /home/chromeuser && \
    # install wget and gnupg2
    apt-get update && \
    apt-get install -y wget gnupg2 && \
    # add chrome apt source
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    # install x11 stuff and chrome
    apt-get update && \
    apt-get install -y x11vnc xvfb fluxbox wget wmctrl google-chrome-stable

EXPOSE 5900

COPY init.sh /

CMD ["/bin/sh", "/init.sh"]

