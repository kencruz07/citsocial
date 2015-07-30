class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:alert] = "Success!"
      redirect_to root_url
    else
      if @user.errors.any?
        flash[:alert] = @user.errors.full_messages
        render "new"
      end
      
    end
  end

  private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
