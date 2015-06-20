class FansController < ApplicationController
  before_action :set_fan, only: [:show, :edit, :update, :destroy]

  def index
    @fans = Fan.all
  end

  def show
  end

  def new
    @fan = Fan.new
  end

  def edit
    if !current_user
      redirect_to root_path
    else
      @fan = current_user
    end
  end

  def create
    @fan = Fan.new(fan_params)

    if @fan.save
      auto_login(@fan)
      redirect_to fan_path(@fan), notice: "Welcome, #{@fan.name}"
    else
      flash.alert = 'Please fix the errors below to continue.'
      render :new
    end
  end

  def update
    respond_to do |format|
      if @fan.update(fan_params)
        format.html { redirect_to @fan, notice: 'Fan was successfully updated.' }
        format.json { render :show, status: :ok, location: @fan }
      else
        format.html { render :edit }
        format.json { render json: @fan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fan.destroy
    respond_to do |format|
      format.html { redirect_to fans_url, notice: 'Fan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_fan
      @fan = Fan.friendly.find(params[:id])
    end

    def fan_params
      params.require(:fan).permit(:name, :email, :password, :password_confirmation)
    end
end
