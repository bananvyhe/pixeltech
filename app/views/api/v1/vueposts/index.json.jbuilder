json.array! @posts do |gb|
	if current_user 
		json.id gb.id	
		json.title gb.title.gsub(/^(.{15,}?).*$/m,'\1...')
	 	json.body gb.body.gsub(/^(.{85,}?).*$/m,'\1...')
	 	json.username gb.user.username
	 	json.clan_name gb.clan_name
	end
end