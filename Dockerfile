FROM nicbet/crystal:0.28.0

# Install Required Dependencies
RUN apt-get update \
 && apt-get install -y wget curl libc6-dev libevent-dev libpcre2-dev libpng-dev libssl-dev libyaml-dev zlib1g-dev

# Install NodeJS 10.x and Yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y build-essential libssl-dev libreadline-dev libxml2-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# Install Postgres Client Libraries
RUN apt-get install -y postgresql-common libpq-dev postgresql-client

# Heroku
RUN curl https://cli-assets.heroku.com/install.sh | sh

# Install lucky
RUN git clone https://github.com/luckyframework/lucky_cli.git \
 && cd lucky_cli \
 && git checkout v0.14.0 \
 && shards install \
 && crystal build src/lucky.cr \
 && mv lucky /usr/local/bin/lucky \
 && cd .. \
 && rm -rf ~/lucky_cli

WORKDIR /app

EXPOSE 5000
CMD ["lucky", "-v"]
