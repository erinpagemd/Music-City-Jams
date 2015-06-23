class GigsController < ApplicationController
  before_filter :load_gig, except: [:index]
  skip_before_action :require_login, only: [:index, :show]
  load_and_authorize_resource
  skip_authorization_check :only => [:index, :show]
  skip_load_and_authorize_resource :only => [:index, :show]


  def index
    @gigs = Gig.all
  end

  def show
    @comments = @gig.comments.all
  end

  def new
    @gig = Gig.new
  end

  def edit
  end

  def create
    @gig.user = current_user


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



  private def gig_params
    params.require(:gig).permit(:name, :location, :date, :description, :image, :user_id)
  end

  private def load_gig
    if params[:id].present?
      @gig = Gig.find(params[:id])
    else
      @gig = Gig.new
    end

    if params[:gig].present?
      @gig.assign_attributes(gig_params)
    end
  end
end
