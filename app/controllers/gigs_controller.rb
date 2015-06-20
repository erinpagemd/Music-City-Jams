class GigsController < ApplicationController
  before_action :set_gig, only: [:show, :edit, :update, :destroy]
  # before_filter :load_user
  before_action :require_login, except: [:index, :show]

  def index
    @gigs = Gig.all
  end

  def show
  end

  def new
    @gig = Gig.new
  end

  def edit
  end

  def create
    @gig = Gig.new(gig_params)

    respond_to do |format|
      if @gig.save
        format.html { redirect_to @gig, notice: 'Gig was successfully created.' }
        format.json { render :show, status: :created, location: @gig }
      else
        format.html { render :new }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @gig.update(gig_params)
        format.html { redirect_to @gig, notice: 'Gig was successfully updated.' }
        format.json { render :show, status: :ok, location: @gig }
      else
        format.html { render :edit }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gig.destroy
    respond_to do |format|
      format.html { redirect_to gigs_url, notice: 'Gig was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_gig
      @gig = Gig.find(params[:id])
    end

    def load_user
      @user = User.find(params[:user_id])
    end

    def gig_params
      params.require(:gig).permit(:name, :location, :date, :description, :image, :user_id)
    end
end
