class UserSessionsController < ApplicationController
  skip_authorization_check
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:user][:email], params[:user][:password])
      redirect_to user_path(@user), notice: "Welcome back, #{@user.name}"
    else
      @user = User.new(email: params[:user][:email])
      flash.alert = "We could not sign you in. Please check your email/password and try again."
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "You have been signed out."
  end
end
