class HomepageController < ApplicationController
  def show
    redirect_to :controller => 'welcome', :action => 'show' unless user_signed_in?
  end
end
