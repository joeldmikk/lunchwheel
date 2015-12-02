class OauthsController < ApplicationController
  skip_before_filter :require_login

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider) {|user| user.email.match('@teamaol.com') }
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule

        if @user
          reset_session # protect from session fixation attack
          auto_login(@user)
          redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
        else
          redirect_to signin_url, :alert => "Failed to login from #{provider.titleize}! Must use @teamaol.com email address!"
        end
      rescue Exception => e
        redirect_to signin_url, :alert => "Failed to login from #{provider.titleize}!"
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :user_id, :provider, :uid)
  end

end