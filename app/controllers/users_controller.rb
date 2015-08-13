class UsersController < ApplicationController

  def index
    if session[:user_id].blank?
      redirect_to root_url
    end
    @users = User.all.alphabetical.decorate
  end

  def new
    @user = User.new
  end

  def show
    @user = UserDecorator.find params[:id]
    @posts = @user.posts.latest.page params[:page]
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:alert] = 'Success!'
      redirect_to root_url
    else
      flash[:alert] = @user.errors.full_messages
      render 'new'
    end
  end

  def user_params
    params.require(:user).
      permit :first_name, :last_name, :email, :password, :password_confirmation
  end

end
