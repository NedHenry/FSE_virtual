class ApplicationController < ActionController::Base

  before_action :verify_age
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :alert => exception.message }
    end
  end

  def verify_age
    unless (cookies.encrypted["age_verify"] == request.remote_ip)
      redirect_to "/welcome?redirect=#{URI.escape(request.fullpath)}"
    end
  end

  def authenticate_admin_user!
    if current_user.nil?
      redirect_to main_app.root_url, :alert => 'You must log in to access this page'
      return false
    elsif  !current_user.admin?
      redirect_to main_app.root_url, :alert => 'You are not allowed to access this page'
      return false
    else
      return true
    end
  end

  def access_denied args=nil
    redirect_to main_app.root_url, :alert => 'You are not allowed to access this page'
  end

   def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
end
