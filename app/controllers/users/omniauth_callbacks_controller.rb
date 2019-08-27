class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Google_oauth2") if is_navigational_format?
    else
      if @user.save
        session["devise.google_oauth2_data"] = request.env["omniauth.auth"]
        redirect_to scrum_path
      else
        flash[:alert] = "Please use valid email address to login"
        redirect_to root_path
      end
    end
  end
  
  def failure
    redirect_to root_path
  end
end