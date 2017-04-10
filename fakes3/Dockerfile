FROM ruby:latest
RUN gem install fakes3 -v 1.0.0
EXPOSE 8081
CMD ["fakes3", "--root=/var/tmp/fakes3", "--port=8081"]