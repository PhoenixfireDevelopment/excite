# README

## Build the Docker Image

```
cd docker
docker-compose build --force-rm excite
```

## Start Docker Compose

```
cd docker
docker-compose up
```

## Visit App

> http://localhost:3000

Login using the credentials you specify under `docker/.secrets.env`. See the `.secrets.env.example` file to substitute in your own credentials. This is set during `rake db:seed`.
