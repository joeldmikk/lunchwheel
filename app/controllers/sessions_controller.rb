class SessionsController < ApplicationController

  skip_before_filter :require_login

  def new
  end

  def create
    user = login(params[:email])
    if user
      redirect_back_or_to root_url
    else
      redirect_to new_session_path
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

end