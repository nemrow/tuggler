class UsersController < ApplicationController

  def create
    user = User.create(params[:user])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def new
    @user = User.find(session[:user_id]) rescue nil
    if @user != nil
      @logged_in = true
    else
      @logged_in = false
      @user = User.new
    end
  end

  def show
    @user = User.find(session[:user_id])
  end
end
