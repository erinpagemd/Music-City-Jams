class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :show, :new, :create]

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_authorization_check


  def index
    @users = User.where(role: 'band')
  end

  def show
    @gigs = @user.gigs
  end

  def new
    @user = User.new
  end

  def edit
    if !current_user
      redirect_to root_path
    else
      @user = current_user
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to user_path(@user), notice: "Welcome, #{@user.name}"
    else
      flash.alert = "Please fix the errors below to continue."
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private def set_user
    @user = User.friendly.find(params[:id])
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
