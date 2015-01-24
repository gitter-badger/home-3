#!/usr/bin/env ruby
require 'rubygems'
require 'gollum/app'

# Wiki path: same as current repo
gollum_path = File.expand_path(File.dirname(__FILE__))

Gollum::GIT_ADAPTER = "rugged"

Precious::App.set(:gollum_path, gollum_path)
Precious::App.set(:default_markup, :markdown)
Precious::App.set(:wiki_options, {
                    :port => 80,
                    :live_preview => true,
                  })
run Precious::App
