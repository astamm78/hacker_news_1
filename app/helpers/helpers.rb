def current_user
  @user ||= User.find_by_username(session[:username])
end
