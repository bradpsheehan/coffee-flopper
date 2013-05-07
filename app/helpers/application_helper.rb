module ApplicationHelper

  def instagram
    if session[:access_token]
      "Connected to Instagram"
    else
      link_to "Connect with Instagram", oauth_connect_path
    end
  end

end
