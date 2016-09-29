class OmniauthCallbacksController < Devise::OmniauthCallbacksController   

  def linkedin
    auth = env["omniauth.auth"]
    @user = User.connect_to_social_sites(request.env["omniauth.auth"],current_user)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.linkedin_uid"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def facebook
    linkedin
  end

  def twitter
    linkedin
  end

  def google_oauth2
    linkedin
  end
  
end