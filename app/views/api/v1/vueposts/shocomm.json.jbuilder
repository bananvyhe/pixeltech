json.array! @postComm do |gb|
	if current_user 
		json.id gb.id	
		json.user_id gb.user_id
	 	json.commentable_type gb.commentable_type 
	 	json.parent_id gb.parent_id
	 	json.body gb.body
	 	# json.username gb.user.username
	 	# json.created_at gb.created_at	
	 	# if gb.comments != []
 		# 	json.comments gb.comments, partial: 'api/v1/vueposts/comment', as: :comment
 		# end
	end
end
# json.array! @postComm do |gb|
# 	json.sd gb
# end