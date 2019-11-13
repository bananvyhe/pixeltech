if current_user 
	json.array! @postComm do |gb|
		json.id gb.id	
		json.user_id gb.user_id
	 	json.body gb.body
	 	json.username gb.user.username
	 	json.commentable_type gb.commentable_type 
	 	json.parent_id gb.parent_id
	 	json.created_at gb.created_at	
	 	if gb.comments != []
 			json.comments gb.comments, partial: './api/v1/vueposts/comment', as: :comment
 		end
	end
end