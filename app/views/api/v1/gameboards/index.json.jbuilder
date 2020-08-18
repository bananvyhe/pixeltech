json.array! @gameboards do |gb|
	if current_user 
	json.id gb.id
	json.username gb.username
	# json.pk gb.gameboard.kill.starts_at_time_of_pk
	# json.kill gb.gameboard.kill.starts_at_time_of_pk

	json.dead gb.gameboard.dead
 	json.karma gb.gameboard.karma
	end
end