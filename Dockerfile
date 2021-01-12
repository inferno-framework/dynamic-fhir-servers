FROM phusion/passenger-ruby27:1.0.12

RUN apt-get update \
  && apt-get upgrade -y -o Dpkg::Options::="--force-confold" \
  && apt-get install -y postgresql-client \
  && rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV development

RUN mkdir /home/app/dfs

WORKDIR /home/app/dfs

ADD Gemfile /home/app/dfs/Gemfile
ADD Gemfile.lock /home/app/dfs/Gemfile.lock

RUN chown -R app:app .

RUN su app -c "bundle config set without 'test'; bundle install"

ADD . /home/app/dfs

ADD config/database.docker.yml /home/app/dfs/config/database.yml
ADD config/config.docker.json /home/app/dfs/config/config.json

# This line is a duplicate however it is done to significantly speed up testing. With this line twice
# we are able to do the bundle install earlier on which means it is cached more often.
RUN chown -R app:app .
RUN chmod -R 0755 .

ENTRYPOINT ["/home/app/dfs/bin/docker-entrypoint.sh"]

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]

EXPOSE 3000
