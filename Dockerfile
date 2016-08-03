FROM centos:7

RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
RUN yum -y install nodejs && yum clean all
COPY . /hubot/
WORKDIR /hubot

RUN npm install -g
