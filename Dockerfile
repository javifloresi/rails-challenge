FROM ruby:3.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# Install dependencies for Node.js and Yarn
RUN apt-get update -qq && \
    apt-get install -y nodejs npm curl gnupg && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y yarn
ENV RAILS_ROOT /var/www/myapp
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT
RUN gem install bundler
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]