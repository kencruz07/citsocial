class MainController < ApplicationController
  def new
  	#raise session[:user_id].inspect
  	if session[:user_id].blank?
  		redirect_to root_url
  	end
  end
end
