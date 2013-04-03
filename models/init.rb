# encoding: utf-8

# Data base configured here so that models can be loaded independently of main application
# $ rake irb:models

require_relative '../patches'
require 'data_mapper'
require 'dm-sqlite-adapter'
require 'dm-postgres-adapter'

DataMapper.setup :default, ENV['DATABASE_URL'] || "sqlite:database.db"
DataMapper::Logger.new($stdout, :debug) if 'development' == ENV['RACK_ENV']

require_relative 'user'