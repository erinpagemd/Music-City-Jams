class GigsController < ApplicationController
  skipped_actions = [:index, :show] | Gig.valid_timelines

  skip_before_action :require_login, only: skipped_actions
  skip_authorization_check :only => skipped_actions
  load_and_authorize_resource except: [:index, :today, :past, :upcoming, :show]


  def index
    @gigs = Gig.all.order(:date)
  end

  def today
    @gigs = Gig.where('date = ?', Date.today)
    render 'index'
  end

  def past
    @gigs = Gig.where('date < ?', Date.today).order(:date)
    render 'index'
  end

  def upcoming
    @gigs = Gig.where('date >= ?', Date.today).order(:date)
    render 'index'
  end

  def show
    load_gig
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
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @gig.update(gig_params)
        format.html { redirect_to @gig, notice: 'Gig was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comments = @gig.comments
    @comments.each do |comment|
      comment.destroy
    end
    @gig.destroy
    respond_to do |format|
      format.html { redirect_to gigs_url, notice: 'Gig was successfully destroyed.' }
    end
  end

  private
  def gig_params
    params.require(:gig).permit(:name, :location, :date, :description, :image, :user_id)
  end

  def load_gig
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
