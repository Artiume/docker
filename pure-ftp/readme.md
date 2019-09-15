# Pure-FTPd

## Supported tags

* `1-alpine`, `1.0-alpine`, `1.0.46-alpine`, `latest` ([Dockerfile](https://github.com/xylphid/dockers/blob/master/pure-ftpd/1.0/Dockerfile))

## How to use this image

### Mounting project

`$ docker run --name some-name -d xylphid/pure-ftpd:1-alpine`

### Exposing external port

`$ docker run --name some-name -v /path/to/projet:/app -p 21:21 -d xylphid/pure-ftpd:1-alpine`
Then you can hit `ftp://localhost/` or `ftp://host-ip`in your explorator.

## How to compose with this image

    version: "3"
    services:
      app:
        image: xylphid/pure-ftpd:1.0.46-alpine
        port:
          - "21:21"
        restart: always

### Traefik configuration

    version: "3"
    services:
      app:
        image: xylphid/pure-ftpd:1.0.46-alpine
        labels:
          - "traefik.backend=my-project"
          - "traefik.frontend.rule=Host:my-project.domain.tld"
          - "traefik.port=21"
        restart: always

## Environments

Here are supported environments variable and its definition :
* DEFAULT_USR : Default user name. Will create a new user if set.
* DEFAULT_PWD : Default user password. Used if DEFAULT_USR is set.
* DEFAULT_ROOT : Root directory for user home

## Persistent data

To make your data persistent, you will need to mount this volumes :
* `/opt/pure/datas/` : root directory for virtual users
* `/opt/pure/secure/` : âssword DB directory

## How to create new users

Connect to the container shell :
`docker exec -it some-name /bin/sh`

You can create new users using the `pure-pw` built-in command :
`pure-pw useradd [username] -u pure -d /opt/pure/datas/[username]`

Options explained :
* **-u :** Uid
* **-d :** Home directory. Make sure the directory exists.

You can find more options in the usage message.

## Quick reference

* [Pure-FTPd](https://www.pureftpd.org/project/pure-ftpd)
* [Documentation](https://www.pureftpd.org/project/pure-ftpd/doc)

## Image inheritance

This docker image inherits from [alpine:3.6](https://hub.docker.com/_/alpine/) image.