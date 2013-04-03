# encoding: utf-8

require 'rubygems'
require 'bundler/setup'
require 'sinatra/config_file'
Bundler.require

class Application < Sinatra::Base
  register Sinatra::ConfigFile
  register Sinatra::Flash
  enable :sessions
  config_file 'config/global.conf'
  use Rack::CommonLogger if Application.development?
end

require_relative 'patches'
require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'controllers/init'