## Sendria

Sendria is a notable replacement of Mailtrap or Mailcatcher

More details can be found on the author's [repository](https://github.com/msztolcman/sendria)
The main benefits over the other solutions are:
- no limits, it's free and open-source
- supports basic authentication, so could be used on test/staging environment

This repository makes the following enhancements:
- build docker for arm64 (m1 support) and amd64
- allow setting auth credential when the image starts


### Usage

Take a look on [docker-compose](docker-compose.yml) or [dockerhero-compose](dockerhero-compose.yml)

[DockHero](https://devcenter.heroku.com/articles/dockhero) allows you to easily setup Sendria on Heroku


### Images:
- ghcr.io/monterail/sendria/dev - no auth required
- ghcr.io/monterail/sendria/prod - auth configured via env variables `SENDRIA_USER`, `SENDRIA_PASS`
