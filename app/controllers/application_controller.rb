class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login

  def select_a_group
    if current_user.group.empty?
      redirect_to select_group_path
    end
  end

  def reset_session_wrap
    reset_session
    redirect_to root_path
  end

  private
  
  def not_authenticated
    redirect_to signin_url
  end

end
