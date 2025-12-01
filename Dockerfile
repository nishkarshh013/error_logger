FROM ruby:3.2-slim

# OS deps for yarn/node & image processing
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn curl imagemagick

WORKDIR /error-logger

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 4 --retry 3

COPY . .

ENV RAILS_ENV=production
ENV RACK_ENV=production
ENV NODE_ENV=production

RUN bundle exec rails assets:precompile

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]