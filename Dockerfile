FROM ruby

RUN apt-get -y update && apt-get -y install libicu-dev
RUN gem install gollum
RUN gem install redcarpet org-ruby 


ENV VIRTUAL_HOST www.actualists.net

VOLUME /wiki
WORKDIR /wiki
CMD ["gollum", "--config", "config.rb", "--port", 80, "--live-preview", "--template-dir", "/wiki/templates"]
EXPOSE 80
