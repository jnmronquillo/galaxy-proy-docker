## Información General
Proyecto de curso

## Setup
Para construir y ejecutar el proyecto ejecutar los siguientes comandos docker:

```
$ cd galaxy-proy-docker
$ docker build -t proy-docker .
$ docker container run --name weatherforecast -d -p 8000:80 proy-docker
$ wget http://localhost:8000/weatherforecast

```