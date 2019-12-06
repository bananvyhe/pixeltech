class CommentsController < ApplicationController
  # skip_before_action :authenticate_user!, raise: false
  # before_action :set_default_format 
  #before_action :authorize_access_request!
  # before_action :verify_authenticity_token
  # before_action :authenticate_user!, raise: false
	#before_action :authenticate_user!
  #before_action :authorize_access_request!

  def index
    @comments = Comment.all.order(created_at: :asc)
  end
  # respond_to :json
	def create
		@comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
 
    @comment.save
    # respond_with '234'
    
  respond_to do |format|
    format.json { render json: @comment }
  end
		# if @comment.save
		# 	 respond_to do |format|
  #       # format.html { redirect_to @commentable }
  #       format.html
  #       format.js
  #     end
  #   else
  #     redirect_to @commentable, alert: "Something went wrong"
  #   end
	end
  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    # redirect for rails view deleting
    # redirect_to @commentable
  end
	private
    # def set_default_format
    #   response.format = :json
    # end
 		def comment_params
      params.require(:comment).permit(:body, :parent_id)
    end
end