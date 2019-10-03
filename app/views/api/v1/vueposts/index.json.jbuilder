json.array! @posts do |gb|
	if current_user 
	json.title gb.title
 	json.body gb.body
 	json.username gb.user.username
 	json.clan_name gb.clan_name
	end
end