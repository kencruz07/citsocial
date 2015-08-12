class SessionsController < ApplicationController

  def new
  	if session[:user_id]
      redirect_to posts_path
    end
  end



  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash[:alert] = 'Invalid email or password'
      redirect_to root_url
    end
  end



  def destroy
  	session[:user_id] = nil
    redirect_to root_url
  end

end
