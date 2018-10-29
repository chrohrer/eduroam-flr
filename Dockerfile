FROM chrohrer/freeradius:0.4

LABEL maintainer="chris.rohrer@ubuntunet.net"

WORKDIR /radius

RUN apk update && apk upgrade && \
    apk add --update freeradius freeradius-radclient && \
    rm /var/cache/apk/*

COPY Radius/mods-config/attr_filter/pre-proxy /etc/raddb/mods-config/attr_filter/pre-proxy
COPY Radius/mods-enabled/f_ticks /etc/raddb/mods-enabled/f_ticks
COPY Radius/sites-enabled/default /etc/raddb/sites-enabled/default

EXPOSE 1812/udp 1813/udp

CMD ["radiusd", "-sfxl", "stdout"]
