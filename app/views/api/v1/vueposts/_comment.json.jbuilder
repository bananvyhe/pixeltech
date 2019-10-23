# json.(comment, :id, :body, :parent_id, :comments )
json.id comment.id	
json.body comment.body
json.parent_id comment.parent_id
json.comments comment.comments, partial: 'api/v1/vueposts/comment', as: :comment
 