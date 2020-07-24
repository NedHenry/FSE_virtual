class HomepageController < ApplicationController
  layout "homepage"
  def show
#    redirect_to :controller => 'welcome', :action => 'show' unless (user_signed_in? || params["demo"]=="show")
  end
  
end
