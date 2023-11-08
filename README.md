# docker-compose-ci

Inspired by [karser/docker-compose-ci](https://hub.docker.com/r/karser/docker-compose-ci), this  CI image is adapted to multi-arch: arm64, amd64 and others using [docker buildx](https://docs.docker.com/engine/reference/commandline/buildx_build/)

## Building image
```
docker buildx build --platform linux/arm64,linux/amd64 --no-cache -t kobebigs/docker-compose-ci -f Dockerfile . --push
```

## How to use image

To use the multi-platform feature, create and initialize a driver. Do not use docker driver as it doesn't support it.

```
docker buildx create --use --name <name of driver>
```

Build for muti-platform 

```
docker buildx build --platform linux/arm64,linux/amd64,linux/arm/v7,linux/arm/v6  -t <tagname>  -f <filepath> .
```

Use `docker buildx build -t <tagname> -f <filepath> .` for single platform.

## Author

- Written & maintained by: [kobebigs](https://kobebigs.com)
