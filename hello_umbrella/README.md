# Hello

A simple react.js integration in a phoenix application.

## Usage

### Install dependencies

```shell
$ mix setup

$ cd apps/hello_web/assets
$ pnpm install
```

### Run application
```shell
$ mix phx.server
```

### Docker

Build docker image:

```shell
$ docker build -t hello .
```

Start docker container:
```shell
$ docker run --rm \
  -e SECRET_KEY_BASE=$(mix phx.gen.secret) \
  -p 4002:4000 \
  hello start
```

Open http://localhost:4002
