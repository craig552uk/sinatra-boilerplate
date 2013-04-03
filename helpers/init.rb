# encoding: utf-8

require_relative '../patches'
require_relative 'route_helpers'
require_relative 'view_helpers'
require_relative 'reserved_words' # Extends String class
require_relative 'mime_type'
require_relative 'session'

if defined?(Application) == 'constant' && Application.class == Class
  Application.helpers RouteHelpers
  Application.helpers ViewHelpers
  Application.helpers Session
end