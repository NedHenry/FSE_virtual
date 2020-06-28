class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :alert => exception.message }
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
  
end
