json.array! @postComm do |gb|
	if current_user 
		json.id gb.id	
		json.user_id gb.user_id
	 	json.body gb.body
	 	json.commentable_type gb.commentable_type
 		# if gb.parent_id == nil
 		json.comments gb.comments, partial: 'api/v1/vueposts/comment', as: :comment
	 	# end
	 	json.parent_id gb.parent_id
	 	json.created_at gb.created_at	
	 	json.username gb.user.username
	end
end