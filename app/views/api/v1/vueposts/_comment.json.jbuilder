json.id comment.id	
json.body comment.body
json.parent_id comment.parent_id
json.username comment.user.username
if comment.comments != []
	json.comments comment.comments, partial: './api/v1/vueposts/comment', as: :comment
end