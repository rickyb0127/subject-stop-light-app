class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :user_name, :password, :password_confirmation, :admin))
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "thanks for signing up yo"
      redirect_to subjects_path
    else
      render :new
    end
  end
end
