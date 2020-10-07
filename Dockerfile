FROM ruby:2.6.6

RUN apt-get update && \
    apt-get install -y mariadb-client nodejs vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y yarn


RUN mkdir /lingochan

WORKDIR /lingochan

ADD Gemfile /lingochan/Gemfile
ADD Gemfile.lock /lingochan/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /lingochan
