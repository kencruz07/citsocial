class FollowingController < ApplicationController
  def index
    @user  = User.find params[:user_id]
    @follow = @user.following
    @title = "#{@user.name}'s following"
    render 'index'
  end
end
