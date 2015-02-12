# ekino/rabbitmq

## Description

ekino's Rabbitmq container

## Basic Usage

Build the image and start a container from it

```bash
# Optionnally build `ekino/rabbitmq` image
docker build --no-cache -t ekino/rabbitmq:latest rabbitmq

# Run container from `ekino/rabbitmq` image
docker run --name rabbitmq -d \
  -p 15672:15672 -p 5672:5672 \
  ekino/rabbitmq:latest
```

Connect to the dashboard with default username/password : `admin/changeme`

```bash
http://localhost:15672
```

## Advanced Usage

### Admin user/password

You can choose either admin username or password (or both) by using `ADMIN_USER`
and/or `ADMIN_PASSWORD` environment variable

```bash
# Run container from `ekino/rabbitmq` image
docker run --name rabbitmq -d \
  -p 15672:15672 -p 5672:5672 \
  -e ADMIN_USER=jamesbond \
  -e ADMIN_PASS=secretagent \
  ekino/rabbitmq:latest
```

### Preload definitions

If you already have a broker definition file (either made by hand or using
the exporting feature of the rabbitmq dashboard) you can start the container
with these definitions loaded at startup by dynamically adding a volume file
to `/etc/rabbitmq/broker_definitions.json`

```bash
docker run --name rabbitmq -d \
  -p 15672:15672 -p 5672:5672 \
  -e ADMIN_PASS=guessit \
  -v /path/to/file.json:/etc/rabbitmq/broker_definitions.json \
  -v $(readlink -f path/to/file.json):/etc/rabbitmq/definitions.json \
  ekino/rabbitmq:latest
```

## Logs

Check the logs :

```bash
# container startup
docker logs rabbitmq
```

## TODO

*Add SSL support*

*Add backend to the stack*

