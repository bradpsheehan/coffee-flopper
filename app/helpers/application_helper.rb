module ApplicationHelper

  def instagram
    if session[:access_token]
      link_to "Connected to Instagram as #{@user.username}", "#"
    else
      link_to "Connect with Instagram", oauth_connect_path
    end
  end

end
