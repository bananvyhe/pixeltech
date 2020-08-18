json.array! @chats do |gb|
	if current_user 
	json.id gb.id
	json.text gb.text	
 	json.clan gb.role.name	
	json.username gb.user.username
	end
end