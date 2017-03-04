backup-mongodb
==============

This is a [Docker](https://docker.com/) image for periodically backing up [MongoDB](https://mongodb.org/) databases.

License
-------

Written in 2016 by Evan Prodromou <evan@fuzzy.ai>

To the extent possible under law, the author(s) have dedicated all copyright and
related and neighboring rights to this software to the public domain worldwide.
This software is distributed without any warranty.

You should have received a copy of the CC0 Public Domain Dedication along with
this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

Installation
------------

The image is available on [Docker Hub](https://hub.docker.com/) as [fuzzyio/backup-mongodb](https://hub.docker.com/r/fuzzyio/backup-mongodb/).

```
  docker pull fuzzyio/backup-mongodb
```

Configuration
-------------

The container makes a daily date-stamped backup of the MongoDB database you
specify to its `/backup` directory. You'll typically want to attach a [volume](https://docs.docker.com/engine/tutorials/dockervolumes/)
to the container so that it backs up to a location under your control.

The image uses the following environment variables:

- *HOST*: The host to connect to for getting the database. Can be a plain
  hostname like `server1` or a replication set definition like `myrepl/server1,server2,server3`.
- *DATABASE* The database to back up. This image will only back up one database;
  run multiple containers if you need multiple databases backed up.

An example [Docker Compose](https://docs.docker.com/compose/) file:

```
version: '2'
services:
  foobar:
    image: mongo:3.2
  backup:
    image: fuzzyio/backup-mongodb
    links:
    - foobar:foobar
    volumes:
     - ./backup:/backup
    environment:
      HOST: foobar
      DATABASE: bazquux
```
