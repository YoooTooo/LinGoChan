FROM ruby:2.6.6

RUN apt-get update && \
    apt-get install -y mariadb-client nodejs vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /lingochan

WORKDIR /lingochan

ADD Gemfile /lingochan/Gemfile
ADD Gemfile.lock /lingochan/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /lingochan
