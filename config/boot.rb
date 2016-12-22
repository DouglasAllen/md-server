# if ENV.fetch("RACK_ENV") == "development"
#   "you're in #{__FILE__}"
# end

require 'pathname'
require 'find'
require 'bundler'
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' # Set up gems listed in the Gemfile.
Bundler.require(:default)
require 'sinatra/base'
require 'tilt/haml'
require 'glorify'
require 'haml'
