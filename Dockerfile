FROM alpine:latest

RUN apk add bind

EXPOSE 53/tcp
EXPOSE 53/udp

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT [ "/bin/entrypoint.sh" ]

RUN mkdir -p /etc/bind/zones
COPY etc/bind/* /etc/bind/
COPY etc/bind/zones/* /etc/bind/zones/
RUN chown root:named /etc/bind/*
RUN chown -R named:named /etc/bind/zones/

