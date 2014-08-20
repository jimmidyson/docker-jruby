FROM debian:latest
MAINTAINER Jimmi Dyson jimmidyson@gmail.com

RUN apt-get update && apt-get install -y --no-install-recommends openjdk-7-jre-headless tar curl && apt-get autoremove -y && apt-get clean

RUN curl http://jruby.org.s3.amazonaws.com/downloads/1.7.13/jruby-bin-1.7.13.tar.gz | tar xz -C /opt

ENV PATH /opt/jruby-1.7.13/bin:$PATH

RUN echo gem: --no-document >> /etc/gemrc

RUN gem update --system
RUN gem install bundler
