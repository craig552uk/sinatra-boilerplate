require 'rubygems'
require 'bundler/setup'
Bundler.require

task :default => 'start:dev'

namespace :start do
  desc 'Start a development server'
  task :dev do
    system 'bundle exec thin start -R config.ru -e development -p 3000'
  end
end

# Database management
namespace :db do
  desc 'Auto-migrate the database (destroys data)'
  task :migrate do
    require_relative 'application.rb'
    DataMapper.finalize
    DataMapper.auto_migrate!
  end

  desc 'Auto-upgrade the database (preserves data)'
  task :upgrade do
    require_relative 'application.rb'
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end
end

# Interactive Ruby
namespace :irb do
  desc 'Start interactive ruby loading application'
  task :app do
    system "irb -I . -r 'application.rb'"
  end

  desc 'Start interactive ruby loading models'
  task :models do
    system "irb -I ./models -r 'init.rb'"
  end

  desc 'Start interactive ruby loading models'
  task :controllers do
    system "irb -I ./controllers -r 'init.rb'"
  end
end
