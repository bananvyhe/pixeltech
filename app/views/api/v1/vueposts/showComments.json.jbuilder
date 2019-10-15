json.array! @postComm do |gb|
	if current_user 
	json.id gb.id	
	json.user_id gb.user_id
 	json.body gb.body
 	json.commentable_type gb.commentable_type
 	json.commentable_id gb.commentable_id
 	json.parent_id gb.parent_id
 	json.created_at gb.created_at	
 	# json.username gb.user.username
 	# json.clan_name gb.clan_name
	end
end