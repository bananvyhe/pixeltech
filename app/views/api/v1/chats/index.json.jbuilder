json.array! @chats do |gb|
	if current_user 
	json.id gb.id
	json.text gb.text	
 	json.clan gb.clan.clan	
	json.username gb.user.username
	end
end