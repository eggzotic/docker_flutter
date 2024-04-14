# Docker with Flutter

A simple demo on how to deploy a Flutter Web App into a Docker Container/App.

## To build the Flutter App (required for all scenarios below)

```BASH
cd counter_app
flutter build web
cd ..
```

Then 1 of the below

## From scratch

This builds the image for your platform, runs the container as an App, from scratch:

```BASH
docker compose up --build -d
```

## Build images & push to Docker Hub

This creates multi-platform images in Docker hub that can be pulled by anyone. You will need to edit `compose.yaml` first, to tailor the image name for your repo...

```BASH
docker buildx bake --push
```

## From Docker Hub Images

To pull/run the pre-built images from the previous section

```BASH
docker compose up -d
```

Then browse to http://localhost:8888 to see the familiar(?) Flutter starter counter app in a container.

Corresponding Docker Hub repo: https://hub.docker.com/r/richardexaba/docker_flutter