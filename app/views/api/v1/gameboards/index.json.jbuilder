json.array! @gameboards do |gb|
	if current_user 
	json.id gb.id
	json.username gb.username
	json.pk gb.gameboard.pk
 	json.karma gb.gameboard.karma
	end
end