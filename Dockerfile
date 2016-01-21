FROM ubuntu:precise
MAINTAINER TerraSeer

RUN apt-get update && apt-get install -qq curl
# install postgresql repository
RUN curl https://alioth.debian.org/scm/loggerhead/pkg-postgresql/postgresql-common/trunk/download/head:/apt.postgresql.org.s-20130224224205-px3qyst90b3xp8zj-1/apt.postgresql.org.sh | bash

# install node repository
RUN curl -sL https://deb.nodesource.com/setup | bash

RUN apt-get install -qq \
  # system
  g++ \
  git \
  make \
  # windshaft
  libcairo2-dev \
  libgif-dev \
  libjpeg8-dev \
  libpq-dev \
  libpango1.0-dev \
  pkg-config \
  # postgresql
  postgis \
  postgresql-9.3 \
  postgresql-server-dev-9.3 \
  # redis
  redis-server \
  # nodejs
  nodejs

RUN npm -g install npm@latest-2

# create directory for docker
RUN mkdir -p /docker/node_modules/
WORKDIR /docker

# install windshaft
RUN curl -LO https://github.com/CartoDB/Windshaft/archive/0.19.4.tar.gz
RUN tar -xvf 0.19.4.tar.gz
RUN rm -rf 0.19.4.tar.gz
RUN mv Windshaft-0.19.4 node_modules/windshaft

# add custom package.json
WORKDIR node_modules/windshaft
ADD package.json ./
RUN npm install

# install testing dependencies
RUN apt-get install -qq imagemagick

# install devDependencies without installing each dependency's devDependencies
RUN npm install $(node -e "var d = require('./package.json').devDependencies; for (var key in d)  { console.log(key + '@' + d[key]) }")

# test windshaft
CMD npm test
