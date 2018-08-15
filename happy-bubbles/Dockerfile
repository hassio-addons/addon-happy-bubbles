ARG BUILD_FROM=hassioaddons/base:2.1.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Setup base
ARG BUILD_ARCH=amd64
# hadolint ignore=DL3003
RUN \
    apk add --no-cache --virtual .build-dependencies \
        unzip=6.0-r2 \
        wget=1.19.5-r0 \
    \
    && apk add --no-cache \
        nginx=1.14.0-r0 \
    \
    && if [[ "${BUILD_ARCH}" = "aarch64" ]]; then ARCH="arm"; fi \
    && if [[ "${BUILD_ARCH}" = "amd64" ]]; then ARCH="386"; fi \
    && if [[ "${BUILD_ARCH}" = "armhf" ]]; then ARCH="arm"; fi \
    && if [[ "${BUILD_ARCH}" = "i386" ]]; then ARCH="386"; fi \
    \
    && wget "https://github.com/happy-bubbles/presence/releases/download/1.8.3/presence_linux_${ARCH}.zip" \
    \
    && mkdir /opt \
    && unzip -d /opt "presence_linux_${ARCH}.zip" \
    \
    && rm "presence_linux_${ARCH}.zip" \
    && apk del --purge .build-dependencies

 # Copy root filesystem
COPY rootfs /

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Happy Bubbles" \
    io.hass.description="Easy presence detection with Bluetooth beacons" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Franck Nijhof <frenck@addons.community>" \
    org.label-schema.description="Easy presence detection with Bluetooth beacons" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Happy Bubbles" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://community.home-assistant.io/t/community-hass-io-add-on-happy-bubbles/53511?u=frenck" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-happy-bubbles/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-happy-bubbles" \
    org.label-schema.vendor="Community Hass.io Add-ons"
