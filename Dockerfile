FROM ruby

# Install rugged adapter to fix https://github.com/gollum/gollum/issues/279

RUN apt-get -y update && apt-get -y install libicu-dev cmake && apt-get clean
RUN gem install --pre gollum gollum-rugged_adapter
RUN gem install redcarpet 

# To fix the following error:
# Rugged::ConfigError - Config value 'user.name' was not found:
# 	/usr/local/bundle/gems/gollum-rugged_adapter-0.2b/lib/rugged_adapter/git_layer_rugged.rb:431:in `create'
RUN git config --global user.name "Anonymous User"
RUN git config --global user.email "nobody@nobody.com"

ENV VIRTUAL_HOST www.actualists.net

VOLUME /wiki
WORKDIR /wiki
CMD ["gollum", "--config", "config.rb", "--port", 80, "--live-preview", "--adapter", "rugged"]
EXPOSE 80
