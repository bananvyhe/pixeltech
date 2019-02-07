class Posts::CommentsController < CommentsController 
	before_action :set_commentable

	def create
		
	end
	private
	def set_commentable
		@commentable = Post.find(params[:post_id])
	end
end