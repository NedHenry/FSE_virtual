FROM ruby:2.7-slim


RUN apt-get -y update && \
      apt-get install --fix-missing --no-install-recommends -qq -y \
        build-essential \
        vim \
        nano \
        wget gnupg \
        git-all \
        curl \
        ssh \
        mariadb-client \
        default-libmysqlclient-dev && \
      wget -qO- https://deb.nodesource.com/setup_12.x  | bash - && \
      apt-get install -y nodejs && \
      wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
      apt-get update && \
      apt-get install yarn

RUN mkdir /fse_virtual
WORKDIR /fse_virtual
COPY ./Gemfile /fse_virtual/Gemfile
COPY ./Gemfile.lock /fse_virtual/Gemfile.lock
RUN gem install bundler -v 2.0.2
RUN bundle install
COPY . /fse_virtual

#Switch to a non-root user
RUN useradd -ms /bin/bash folsom
RUN chown -R folsom:folsom /fse_virtual
USER folsom

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

