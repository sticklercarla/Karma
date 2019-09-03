class ApplicationController < ActionController::Base
  before_action :session_user
  before_action :authorized?

  def session_user
    @user_id = session[:user_id]
    @logged_in = !!@user_id

    if @logged_in
      @current_user = User.find(@user_id)
    end
  end

  def authorized?
    unless @logged_in
      return redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
  end
end
