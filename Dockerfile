FROM centos:7

RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
RUN yum -y install nodejs gcc gcc-c++ make && yum clean all
ADD . /hubot/
WORKDIR /hubot

RUN npm install -g

CMD bin/hubot -a slack 
