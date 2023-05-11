class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to my blog #{@user.username}"
      redirect_to articles_path
    else
      redirect_to root_path
    end
  end
end
