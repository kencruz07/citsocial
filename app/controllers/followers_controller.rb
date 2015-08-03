class FollowersController < ApplicationController
  def index
    @user  = User.find params[:user_id]
    @follow = @user.followers
    @title = "#{@user.name}'s followers"
    render 'index'
  end
end
