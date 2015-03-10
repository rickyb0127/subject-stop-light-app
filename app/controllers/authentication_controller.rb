class AuthenticationController < ApplicationController
  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "you are signed in!!!"
      redirect_to admin_subjects_path
    else
      @user = User.new
      @user.errors[:email] << ' / Password combination is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end
end
