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
        libnss3-dev libgconf-2-4 libnss3 libxss1\
        default-libmysqlclient-dev && \
      wget -qO- https://deb.nodesource.com/setup_12.x  | bash - && \
      apt-get install -y nodejs && \
      wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
      apt-get update && \
      apt-get install yarn

RUN apt-get -y install fonts-liberation libappindicator3-1 libdrm2 libgbm1 libxcb-dri3-0 libxtst6 xdg-utils
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb || apt update && apt-get install -f -y

RUN mkdir /fse_virtual
WORKDIR /fse_virtual
COPY ./Gemfile /fse_virtual/Gemfile
COPY ./Gemfile.lock /fse_virtual/Gemfile.lock
RUN gem install bundler -v 2.0.2
RUN RAILS_ENV=development bundle install
COPY . /fse_virtual

#Switch to a non-root user
RUN useradd -ms /bin/bash folsom
RUN chown -R folsom:folsom /fse_virtual
RUN chown -R folsom:folsom /usr/local/bundle
USER folsom

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

