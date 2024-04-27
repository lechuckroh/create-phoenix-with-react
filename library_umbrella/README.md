# Library.Umbrella

## Requirements

```shell
# install Elixir
$ brew install elixir

# install HEX (package manager)
$ mix local.hex

# install rebar (Erlang package manager)
$ mix local.rebar --force

# install Phoenix
$ mix archive.install hex phx_new

# debian/ubuntu only
$ sudo apt-get install inotify-tools
```

## DB

```shell
# start DB in docker container and migrate DB schema
$ task db-start

# remove docker containers and data
$ task db-rm

# install dependencies
$ task install

# migrate DB schema
$ task db-migrate

# rollback DB schema 1 step
$ task db-rollback-1

# insert seed data
$ task db-seed-data
```

## Run

```shell
# run dev server
$ task run
```

Open http://localhost:4000.

## Deploy

```shell
# build docker image
$ task docker-build

# run docker image
$ task docker-run
```
