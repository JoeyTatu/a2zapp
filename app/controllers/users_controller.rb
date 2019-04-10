class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = User.find(current_user.id)
  end
  
  def profile
    @user = User.find(current_user.id)
  end
  
end
