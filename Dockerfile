#syntax=docker/dockerfile:1.3-labs
FROM ruby:2.7.2
RUN <<EOF
apt-get update -y
apt-get install -y curl libcurl4 libcurl4-openssl-dev graphviz
EOF
WORKDIR /app
COPY . .
RUN bundle instal
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn
RUN yarn install
