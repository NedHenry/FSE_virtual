class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :alert => exception.message }
    end
  end

  def authenticate_admin_user!
    redirect_to main_app.root_url, :alert => 'You must log in to access this page' unless current_user.present?
    redirect_to main_app.root_url, :alert => 'You are not allowed to access this page' unless current_user.admin?
    return true
  end

  def access_denied
    redirect_to main_app.root_url, :alert => 'You are not allowed to access this page'
  end
  
end
