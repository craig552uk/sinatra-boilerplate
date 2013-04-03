# encoding: utf-8

module RouteHelpers

  # Get a local path without browser redirect
  def get_alias(url)
    call env.merge('PATH_INFO' => url)
  end

end