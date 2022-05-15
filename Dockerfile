FROM alpine:3.15.4

# install dependencies
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 py3-pip nginx fcgiwrap socat

# create python link
RUN test -s /usr/bin/python || ln -s python3 /usr/bin/python

# default http server config
COPY default.conf /etc/nginx/http.d/

# default html app
COPY www /var/www/html

# health check: test fcgiwrap socket listener
HEALTHCHECK --interval=30s --timeout=3s \
  CMD socat -u OPEN:/dev/null UNIX-CONNECT:/var/run/fcgiwrap.socket || exit 1

# entrypoint and services
ADD entrypoint.sh .
ENTRYPOINT ["sh", "./entrypoint.sh"]
