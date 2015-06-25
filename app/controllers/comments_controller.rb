class CommentsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  load_and_authorize_resource

  def create
    @gig = Gig.find(params[:gig_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.gig = @gig

    if @comment.save
      redirect_to user_gig_path(@gig.user, @gig), notice: "Your comment has been saved"
    else
      flash.alert = "Your comment could not be published. Please correct the errors below."
      render "gigs/show"
    end
  end

  def destroy
    set_comment
    @comment.destroy
    respond_to do |format|
      redirect_to user_path(@comment.user), notice: 'Comment was successfully destroyed.'
    end
  end

  private def set_comment
    @comment = Comment.find(params[:id])
  end

  private def comment_params
    params.require(:comment).permit(:reference, :reference, :body)
  end
end
