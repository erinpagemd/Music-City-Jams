class FanSessionsController < ApplicationController
  def new
    @fan = Fan.new
  end

  def create
    if @fan = login(params[:fan][:email], params[:fan][:password])
      redirect_to fan_path(@fan), notice: "Welcome back, #{@fan.name}"
    else
      @fan = Fan.new(email: params[:fan][:email])
      flash.alert = "We could not sign you in. Please check your email/password and try again."
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "You have been signed out."
  end
end
