# Docker with Flutter

A simple demo on how to deploy a Flutter Web App into a Docker Container/App

```BASH
cd counter_app
flutter build web
cd ..
docker compose up
```

Then browse to http://localhost:8888 to see the familiar(?) Flutter starter counter app in a container.