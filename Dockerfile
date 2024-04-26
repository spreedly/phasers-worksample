# syntax=docker/dockerfile:1
FROM ruby:3.2.3
LABEL maintainer="ops@spreedly.com"

ENV NODE_VERSION=20.x
COPY script/install_node.sh /tmp
RUN /tmp/install_node.sh

RUN mkdir /srv/phasers
WORKDIR /srv/phasers

COPY Gemfile /srv/phasers/Gemfile
COPY Gemfile.lock /srv/phasers/Gemfile.lock
COPY vendor/ /srv/phasers/vendor
RUN gem install bundler
RUN bundle install --local
COPY ./ /srv/phasers

EXPOSE 3000/tcp
ENTRYPOINT ["/usr/local/bundle/bin/bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
