class SessionsController < ApplicationController
  def new
  	
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      session[:first_name] = user.first_name
      redirect_to :controller => 'main', :action => 'new'
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
