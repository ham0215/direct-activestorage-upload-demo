FROM ruby:3.2.0-preview1

RUN apt-get update && apt-get install -y \
  build-essential \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV LANG ja_JP.UTF-8

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]