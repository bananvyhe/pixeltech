class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, optional: true, class_name: "Comment"

  def comments
  	Comment.where(commentable: commentable, parent_id: id)
  end

  def destroy
  	update( body: nil)
  end

  def deleted?
  	body.nil?
  end
  # def child_comments
  # 	Comment.where(parent: self)
  # end
  # before destroy :handle_children
  # def handle_children
  # 	child_comments.update_all(parent_id: parent_id)
  # end
end
