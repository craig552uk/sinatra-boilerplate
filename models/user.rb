# encoding: utf-8

class User
  include DataMapper::Resource

  property :id,          Serial
  property :email,       String, :format   => :email_address
  property :screen_name, String, :required => true, :unique => true
  property :session_key, String, :default  => lambda{ |r,_| r.screen_name.uniq_hash }
  timestamps :at

  before :save do
    # Pre-save actions
  end

  before :destroy do
    # Pre-destroy actions
  end

  def self.find_by_session_key(key)
    User.first(:session_key => key)
  end

  def refresh_session_key
    self.session_key = self.screen_name.uniq_hash
  end
end