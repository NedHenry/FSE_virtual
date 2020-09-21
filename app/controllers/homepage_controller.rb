class HomepageController < ApplicationController
  layout "application"
  def show
#    redirect_to :controller => 'welcome', :action => 'show' unless (user_signed_in? || params["demo"]=="show")
  end
  
end
