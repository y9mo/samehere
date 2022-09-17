FROM node:16.17.0-alpine3.16 as builder

RUN apk update && \
  apk add build-base autoconf automake libtool pkgconfig nasm

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

WORKDIR /app

COPY ./package*.json ./

RUN npm install

COPY . .

ENTRYPOINT ["npm", "run", "develop"]
