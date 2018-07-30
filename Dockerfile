################################
#                              #
#   Ubuntu - NODE:latest       #
#                              #
################################

FROM ubuntu:16.04
MAINTAINER solegs "solegs@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yqq \
    && apt-get install -yqq \
	ca-certificates \
    git \
    gcc \
    make \
    wget \
    mc \
    curl \
    sendmail

RUN DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python-software-properties
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common

RUN apt-get update
RUN apt-get -qq update
RUN apt-get install -y nodejs npm
# TODO could uninstall some build dependencies

# fucking debian installs `node` as `nodejs`
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

RUN npm cache clean -f
RUN npm install -g n
RUN n stable

CMD ["npm", "start"]

EXPOSE 3000
