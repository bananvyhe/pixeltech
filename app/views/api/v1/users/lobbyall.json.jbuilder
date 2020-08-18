	json.array! @users do |users|
		json.username users.username
		json.id users.id
	end