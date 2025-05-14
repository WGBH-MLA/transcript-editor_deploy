FROM ruby:2.5.3

COPY . .
RUN bundle install

CMD tail -f /dev/null
# bundle exec cap deploy