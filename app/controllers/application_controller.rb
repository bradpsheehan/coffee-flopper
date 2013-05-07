class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :instagram

  def instagram
    if session[:access_token]
      client = Instagram.client(:access_token => session[:access_token])
      @user = client.user
      @images = client.user_recent_media
    end
  end
end
