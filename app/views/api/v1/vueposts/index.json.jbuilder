json.array! @posts do |gb|
	if current_user 
	json.title gb.title
 	json.body gb.body
 	json.user_id gb.user_id
 	json.clan_name gb.clan_name
	end
end