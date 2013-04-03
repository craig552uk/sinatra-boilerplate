# encoding: utf-8

class Application < Sinatra::Base

  get '/login/?' do
    create_session User.first # Obviously do some authentication here
    "Logged in #{current_user.screen_name}"
  end

  get '/logout/?' do
    destroy_session
    "logged out"
  end
end