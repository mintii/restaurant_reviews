helpers do
  def logged_in?
    session[:user_id] != nil
  end

  def authenticate
    redirect '/' unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end
