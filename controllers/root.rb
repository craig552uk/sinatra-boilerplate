# encoding: utf-8

class Application < Sinatra::Base

  get '/?' do
    erb :index
  end

  not_found do
    "Error 404 - Page Not Found"
  end

  error do
    "Error 500 - Server Error"
  end
end