FROM debian:latest
MAINTAINER Jimmi Dyson jimmi.dyson@specsavers.com

RUN apt-get update && apt-get install -y openjdk-7-jre && apt-get autoremove -y

ADD http://jruby.org.s3.amazonaws.com/downloads/1.7.13/jruby-bin-1.7.13.tar.gz /jruby-bin-1.7.13.tar.gz
ADD http://jruby.org.s3.amazonaws.com/downloads/1.7.13/jruby-bin-1.7.13.tar.gz.sha1 /jruby-bin-1.7.13.tar.gz.sha1
RUN echo `cat jruby-bin-1.7.13.tar.gz.sha1`\  jruby-bin-1.7.13.tar.gz|sha1sum -c --quiet

RUN tar xf /jruby-bin-1.7.13.tar.gz -C /opt
RUN rm -f /jruby-bin-1.7.13.tar.gz*

ENV PATH /opt/jruby-1.7.13/bin:$PATH

RUN echo gem: --no-document >> /etc/gemrc

RUN gem update --system
RUN gem install bundler
