#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Happy Bubbles
# Persists the presence database (and create if missing)
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

if ! hass.file_exists '/data/presence.db'; then
    hass.log.debug 'Starting Presence temporarly...'

    cd /opt || exit
    exec 3< <(./presence)

    # Wait until the db exists
    until hass.file_exists "/opt/presence.db"; do
        sleep 1
    done

    # Just to be safe, wait another 2 seconds
    sleep 2

    # Kill it, if still alive
    kill "$(pgrep presence)" >/dev/null 2>&1 || true

    # Move the created database into a safe place
    mv /opt/presence.db /data/presence.db

    hass.log.debug 'Persistent presence.db database created'
fi

ln -s /data/presence.db /opt/presence.db
