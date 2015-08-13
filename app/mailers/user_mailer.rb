class UserMailer < ApplicationMailer

  def notification user, msg
    @user = user
    @msg = msg
    mail(:to => @user.email,
      :subject => "New comment from #{@user}:")
  end

end
