FROM debian:latest
MAINTAINER Jimmi Dyson jimmidyson@gmail.com

RUN apt-get update && apt-get install -y --no-install-recommends openjdk-7-jre-headless tar curl && apt-get autoremove -y && apt-get clean

ENV JRUBY_VERSION 1.7.14

RUN curl http://jruby.org.s3.amazonaws.com/downloads/$JRUBY_VERSION/jruby-bin-$JRUBY_VERSION.tar.gz | tar xz -C /opt

ENV PATH /opt/jruby-$JRUBY_VERSION/bin:$PATH

RUN echo gem: --no-document >> /etc/gemrc

RUN gem update --system
RUN gem install bundler
