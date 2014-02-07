class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome aboard"
      redirect_to root_path
    else
      flash[:error] = "There is something wrong, please fix"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are out!!!!"
    redirect_to root_path
  end
end