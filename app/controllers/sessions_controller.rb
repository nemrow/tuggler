class SessionsController < ApplicationController
  def create
    user_data = params[:user]
    user = User.find_by_email(user_data['email'])
    if user && user.authenticate(user_data['password'])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
