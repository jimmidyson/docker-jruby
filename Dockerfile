FROM tianon/centos:6.5
MAINTAINER Jimmi Dyson jimmi.dyson@specsavers.com

RUN yum update --setopt=tsflags=nodocs --setopt=group_package_types=mandatory -y
RUN yum install --setopt=tsflags=nodocs --setopt=group_package_types=mandatory -y java-1.7.0-openjdk.x86_64 tar
RUN yum clean all

ADD http://jruby.org.s3.amazonaws.com/downloads/1.7.11/jruby-bin-1.7.11.tar.gz /jruby-bin-1.7.11.tar.gz
ADD http://jruby.org.s3.amazonaws.com/downloads/1.7.11/jruby-bin-1.7.11.tar.gz.sha1 /jruby-bin-1.7.11.tar.gz.sha1
RUN echo `cat jruby-bin-1.7.11.tar.gz.sha1`\  jruby-bin-1.7.11.tar.gz|sha1sum -c --quiet

RUN tar xf /jruby-bin-1.7.11.tar.gz -C /opt
RUN rm -f /jruby-bin-1.7.11.tar.gz*

ENV PATH /opt/jruby-1.7.11/bin:$PATH

RUN echo gem: --no-document >> /etc/gemrc

RUN gem update --system
RUN gem install bundler
