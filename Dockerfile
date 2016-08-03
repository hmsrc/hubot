FROM centos:7

RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
RUN yum -y install nodejs gcc gcc-c++ make ruby-devel rubygems && yum clean all
ADD . /hubot/
WORKDIR /hubot
RUN gem install puppet-whats
RUN ln -s /hubot/whats.yaml /root/.whats.yaml
RUN npm install -g

CMD bin/hubot -a slack
