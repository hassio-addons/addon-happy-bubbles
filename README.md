# Community Hass.io Add-ons: Happy Bubbles

[![GitHub Release][releases-shield]][releases]
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE.md)

[![GitLab CI][gitlabci-shield]][gitlabci]
![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

[![Discord][discord-shield]][discord]
[![Community Forum][forum-shield]][forum]

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

[![Support my work on Patreon][patreon-shield]][patreon]

Presence detection server for Happy Bubbles Bluetooth beacon-based
presence detection system.

## About

This add-on is a server that subscribes to MQTT topics that the "Happy Bubbles"
Bluetooth Beacon Presence Detectors publish to. It checks to see which of the
detectors found the strongest signal for a particular beacon, and then lets
you access that info either over an API, or a web interface.

It is designed to be used as a home-automation presence detection system.
If you install the detectors through-out a home and family members carry
beacons around the house, you can program your home automation hubs to
take certain actions depending on who entered or left certain rooms.

This add-on also publishes changes in location to a particular topic.
So you can program your hub to listen for these and make the desired changes
as they happen, to not have to keep polling it.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Hass.io add-on.

1. [Add our Hass.io add-ons repository][repository] to your Hass.io instance.
1. Install the "Happy Bubbles" add-on.
1. Start the "Happy Bubbles" add-on
1. Check the logs of the "Happy Bubbles" add-on to see if everything went well.

**NOTE**: Do not add this repository to Hass.io, please use:
`https://github.com/hassio-addons/repository`.

## Docker status

[![Docker Architecture][armhf-arch-shield]][armhf-dockerhub]
[![Docker Version][armhf-version-shield]][armhf-microbadger]
[![Docker Layers][armhf-layers-shield]][armhf-microbadger]
[![Docker Pulls][armhf-pulls-shield]][armhf-dockerhub]

[![Docker Architecture][aarch64-arch-shield]][aarch64-dockerhub]
[![Docker Version][aarch64-version-shield]][aarch64-microbadger]
[![Docker Layers][aarch64-layers-shield]][aarch64-microbadger]
[![Docker Pulls][aarch64-pulls-shield]][aarch64-dockerhub]

[![Docker Architecture][amd64-arch-shield]][amd64-dockerhub]
[![Docker Version][amd64-version-shield]][amd64-microbadger]
[![Docker Layers][amd64-layers-shield]][amd64-microbadger]
[![Docker Pulls][amd64-pulls-shield]][amd64-dockerhub]

[![Docker Architecture][i386-arch-shield]][i386-dockerhub]
[![Docker Version][i386-version-shield]][i386-microbadger]
[![Docker Layers][i386-layers-shield]][i386-microbadger]
[![Docker Pulls][i386-pulls-shield]][i386-dockerhub]

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```json
{
    "log_level": "info",
    "ssl": false,
    "certfile": "fullchain.pem",
    "keyfile": "privkey.pem",
    "ipv6": false,
    "mqtt_host": "homeassistant",
    "mqtt_port": 1883,
    "mqtt_client_id": "happy_bubbles",
    "mqtt_username": "happybubbles",
    "mqtt_password": "dontworrybehappy"
}
```

**Note**: _This is just an example, don't copy and past it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`:  Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface.
Set it `true` to enable it, `false` otherwise.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default for Hass.io_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default for Hass.io_

### Option: `ipv6`

Set this option to `false` to disable IPv6 support.

### Option: `mqtt_host`

The hostname or IP of the MQTT server to connect to.

**Note**: _If you are using the core MQTT add-on, `homeassistant` should work
out of the box._

### Option: `mqtt_port`

The port to connect to on the MQTT server, which normally is `1883`.

### Option: `mqtt_client_id`

The MQTT client ID of the Happy Bubbles presence server.

**Note**: _This option support secrets, e.g., `!secret client_id`._

### Option: `mqtt_username`

The username to use when connecting to the MQTT server.

**Note**: _This option support secrets, e.g., `!secret mqtt_username`._

### Option: `mqtt_password`

The password to use when connecting to the MQTT server.

**Note**: _This option support secrets, e.g., `!secret mqtt_password`._

## Embedding into Home Assistant

It is possible to embed the Happy Bubbles interface directly into
Home Assistant, allowing you to access it through the Home Assistant frontend.

Home Assistant provides the `panel_iframe` component, for these purposes.

Example configuration:

```yaml
panel_iframe:
  happybubbles:
    title: Happy Bubbles
    icon: mdi:bluetooth
    url: http://addres.to.your.hass.io:5555
```

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality. The format of the log is based on
[Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The [Community Hass.io Add-ons Discord chat server][discord] for add-on
  support and feature requests.
- The [Home Assistant Discord chat server][discord-ha] for general Home
  Assistant discussions and questions.
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

## Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

We have set up a separate document containing our
[contribution guidelines](CONTRIBUTING.md).

Thank you for being involved! :heart_eyes:

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## We have got some Hass.io add-ons for you

Want some more functionality to your Hass.io Home Assistant instance?

We have created multiple add-ons for Hass.io. For a full list, check out
our [GitHub Repository][repository].

## License

MIT License

Copyright (c) 2018 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[aarch64-arch-shield]: https://img.shields.io/badge/architecture-aarch64-blue.svg
[aarch64-dockerhub]: https://hub.docker.com/r/hassioaddons/happy-bubbles-aarch64
[aarch64-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/happy-bubbles-aarch64.svg
[aarch64-microbadger]: https://microbadger.com/images/hassioaddons/happy-bubbles-aarch64
[aarch64-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/happy-bubbles-aarch64.svg
[aarch64-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/happy-bubbles-aarch64.svg
[amd64-arch-shield]: https://img.shields.io/badge/architecture-amd64-blue.svg
[amd64-dockerhub]: https://hub.docker.com/r/hassioaddons/happy-bubbles-amd64
[amd64-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/happy-bubbles-amd64.svg
[amd64-microbadger]: https://microbadger.com/images/hassioaddons/happy-bubbles-amd64
[amd64-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/happy-bubbles-amd64.svg
[amd64-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/happy-bubbles-amd64.svg
[armhf-arch-shield]: https://img.shields.io/badge/architecture-armhf-blue.svg
[armhf-dockerhub]: https://hub.docker.com/r/hassioaddons/happy-bubbles-armhf
[armhf-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/happy-bubbles-armhf.svg
[armhf-microbadger]: https://microbadger.com/images/hassioaddons/happy-bubbles-armhf
[armhf-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/happy-bubbles-armhf.svg
[armhf-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/happy-bubbles-armhf.svg
[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/frenck
[commits-shield]: https://img.shields.io/github/commit-activity/y/hassio-addons/addon-happy-bubbles.svg
[commits]: https://github.com/hassio-addons/addon-happy-bubbles/commits/master
[contributors]: https://github.com/hassio-addons/addon-happy-bubbles/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/community-hass-io-add-on-happy-bubbles/53511?u=frenck
[frenck]: https://github.com/frenck
[gitlabci-shield]: https://gitlab.com/hassio-addons/addon-happy-bubbles/badges/master/pipeline.svg
[gitlabci]: https://gitlab.com/hassio-addons/addon-happy-bubbles/pipelines
[home-assistant]: https://home-assistant.io
[i386-arch-shield]: https://img.shields.io/badge/architecture-i386-blue.svg
[i386-dockerhub]: https://hub.docker.com/r/hassioaddons/happy-bubbles-i386
[i386-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/happy-bubbles-i386.svg
[i386-microbadger]: https://microbadger.com/images/hassioaddons/happy-bubbles-i386
[i386-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/happy-bubbles-i386.svg
[i386-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/happy-bubbles-i386.svg
[issue]: https://github.com/hassio-addons/addon-happy-bubbles/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[license-shield]: https://img.shields.io/github/license/hassio-addons/addon-happy-bubbles.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2018.svg
[patreon-shield]: https://www.frenck.nl/images/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[reddit]: https://reddit.com/r/homeassistant
[releases-shield]: https://img.shields.io/github/release/hassio-addons/addon-happy-bubbles.svg
[releases]: https://github.com/hassio-addons/addon-happy-bubbles/releases
[repository]: https://github.com/hassio-addons/repository
[semver]: http://semver.org/spec/v2.0.0.htm
