module SessionsHelper

  def log_in(user)
    session[:user] = user.id
  end

  def log_out
    session.delete(:user)
    @current_user = nil
  end

  def current_user
    @current_user ||= session[:user]
  end

  def logged_in?
    !current_user.nil?
  end

  def admin?
    logged_in? && User.find(current_user).admin?
  end

end
