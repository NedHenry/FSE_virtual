class UserController < ApplicationController

  before_action :set_user

  def set_user
    if params['username'].present?
      @user = User.find_by(username: params['username'])
    elsif params['id'].present?
      @user = User.find(id)
    end
  end
  
  def show
  end
  
  def edit
  end

  def update
    @user.avatar.attach(user_params["avatar"]) if user_params["avatar"].present?
    @user.update!(user_params.except("avatar"))
    
    flash['success'] = "Profile updated successfully"
    redirect_to "/user/#{@user.username}"
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :display_name,:avatar,:pronouns, :fetlife, :description)
  end
  
end
