FROM ruby

# Install rugged adapter to fix https://github.com/gollum/gollum/issues/279

RUN apt-get -y update && apt-get -y install libicu-dev cmake && apt-get clean
RUN gem install --pre gollum gollum-rugged_adapter
RUN gem install redcarpet 

ENV VIRTUAL_HOST www.actualists.net

VOLUME /wiki
WORKDIR /wiki
CMD ["gollum", "--config", "config.rb", "--port", 80, "--live-preview", "--adapter", "rugged"]
EXPOSE 80
