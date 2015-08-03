class UsersController < ApplicationController
  def index
    if session[:user_id].blank?
      redirect_to root_url
    end
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def show
    @user = User.find params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:alert] = "Success!"
      redirect_to root_url
    else
      flash[:alert] = @user.errors.full_messages
      render "new"
    end
  end

  def user_params
  	params.require(:user).permit :first_name, :last_name, :email, :password, :password_confirmation
  end

  def following
    @user  = User.find params[:id]
    @follow = @user.following
    @title = "#{@user.name}'s following"
    render 'follow_list'
  end

  def followers
    @user  = User.find params[:id]
    @follow = @user.followers
    @title = "#{@user.name}'s followers"
    render 'follow_list'
  end
end
