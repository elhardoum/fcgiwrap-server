## fcgiwrap nginx server

Run FastCGI applications with fcgiwrap and nginx on Alpine Linux (docker).

This docker package comes with python support, and runs a sample python app.

### Usage

Using docker:

```sh
# run on port 9000
docker run -p 9000:80 -d elhardoum/fcgiwrap-server:latest

# or, run with a custom www folder
docker run -p 9000:80 -v ./path/to/local/www:/var/www/html -d elhardoum/fcgiwrap-server:latest

# or, run a local build - cd to where Dockerfile is
docker run -p 9000:80 -d $(docker build -q .)
```

Using docker-compose:

```sh
docker-compose up -d
```
