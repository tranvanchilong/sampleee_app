class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def new
  end
  def create
   
    @comment = Comment.new status_comment_params
    begin
      if @comment.save!
        flash[:success] = "Created"
      end
    rescue => e
      flash[:waring] = e.message
    end
    respond_to do |format|
      format.html {
        redirect_to request.referer
       }
      format.js
    end
  end

  def destroy  
    @comment = Comment.find status_comment_params
    @comment.destroy
    redirect_to request.referer
    # @comment.user
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :images)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end

  private
    def status_comment_params
      params.require(:comment).permit(:micropost_id, :user_id, :content)
    end
end