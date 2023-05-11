class SessionController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]

  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in'
    else
      flash[:error] = 'There was something wrong with your login info'
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to root_path
  end

  private

  def logged_in_redirect
    return unless logged_in?

    flash[:error] = 'You are already logged in'
    redirect_to root_path
  end
end
