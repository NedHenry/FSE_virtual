class WelcomeController < ApplicationController
  layout "splash"
  def show
    @login_choice_text = "Hey there. First time?"
  end
end
