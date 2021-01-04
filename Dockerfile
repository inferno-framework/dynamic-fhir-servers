FROM phusion/passenger-ruby27:1.0.12

ENV RAILS_ENV development

RUN mkdir /home/app/dfs

WORKDIR /home/app/dfs

ADD Gemfile /home/app/dfs/Gemfile
ADD Gemfile.lock /home/app/dfs/Gemfile.lock

RUN chown -R app:app .

RUN su app -c "bundle config set without 'test'; bundle install"

ADD . /home/app/dfs

# This line is a duplicate however it is done to significantly speed up testing. With this line twice
# we are able to do the bundle install earlier on which means it is cached more often.
RUN chown -R app:app .
RUN chmod -R 0755 .

ENTRYPOINT ["./bin/rails", "server", "-b", "0.0.0.0"]

EXPOSE 3000
