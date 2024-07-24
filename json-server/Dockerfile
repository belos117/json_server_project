# syntax = docker/dockerfile:1.4
FROM node:16.17-alpine3.15
WORKDIR ./
COPY . .
RUN npm install -g json-server
EXPOSE 3000
ENTRYPOINT ["json-server", "--watch", "db.json", "--port", "3000", "--host", "0.0.0.0"]
