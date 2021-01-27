FROM ruby:2.5.1-alpine
ENV BUNDLER_VERSION=2.1.4

WORKDIR /opt/app

RUN apk add nodejs
RUN apk update && apk add --virtual build-dependencies build-base
RUN apk add --no-cache tzdata
RUN apk add sqlite-dev

WORKDIR /opt/app/url_shortener

RUN gem install rails
RUN gem install bundler -v 2.1.4

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY ./ ./

CMD ["bundle", "exec", "rails", "s", "-p", "4000", "-b", "0.0.0.0"]
