FROM ruby:2.4.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /twitterspace
WORKDIR /twitterspace
ADD Gemfile /twitterspace/Gemfile
ADD Gemfile.lock /twitterspace/Gemfile.lock
RUN bundle install
ADD . /twitterspace
