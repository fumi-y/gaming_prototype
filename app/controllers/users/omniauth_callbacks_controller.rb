class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    authorization
   end

  private
  def authorization
    @user = User.from_omniauth(request.env["omniauth.auth"])
  end
end
