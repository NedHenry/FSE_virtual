class WelcomeController < ApplicationController
  layout :welcome_layout

  def welcome_layout
#    "application"
    params['demo']=="show" ? "application" : "splash"
  end

  skip_before_action :verify_age

  def rules
  end
  
  def show
  #  @login_choice_text = "Hey there. First time?"
  end

  def confirm_age
    cookies.encrypted["age_verify"] = request.remote_ip
    if params['redirect'].present?
      redirect_to URI.unescape(params['redirect'])
    else
      redirect_to "/"
    end
    
  end

end
