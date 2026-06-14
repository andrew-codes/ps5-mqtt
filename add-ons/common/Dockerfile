ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ARG BUILD_VERSION

RUN apk add --no-cache --virtual .build-dependencies \
    make gcc g++ linux-headers udev git python3 && \
    apk add --no-cache nodejs npm

RUN corepack enable

RUN npm i -g playactor
RUN mkdir -p ~/.config/playactor

RUN mkdir -p app

COPY . ./app

RUN cd /app && \
    yarn workspaces focus @ps5-mqtt/server --production

# set permissions for both docker standalone and HA add-on startup scripts
RUN chmod a+x /app/ps5-mqtt/run.sh
RUN chmod a+x /app/ps5-mqtt/run-standalone.sh

EXPOSE 8645

ENTRYPOINT ["/app/ps5-mqtt/run.sh"]
