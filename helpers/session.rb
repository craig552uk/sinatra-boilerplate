# encoding: utf-8

module Session

  def current_user
    session_key = session[:user_key] || request.cookies['user_key'] || 'xxx'
    @current_user ||= User.find_by_session_key session_key
  end

  def authenticated?
    ! current_user.nil?
  end

  def create_session(user)
    session[:user_key] = user.session_key
    create_persistent_cookie 'user_key', user.session_key
  end

  def destroy_session
    session.delete(:user_key)
    delete_persistent_cookie 'user_key'
  end

  private

  def create_persistent_cookie(key, value)
    response.set_cookie key, {
      :value    => value,
      :httponly => true,
      :max_age  => 1.to_s,
      :path     => '/'}
  end

  def delete_persistent_cookie(key)
    response.delete_cookie key
  end

end