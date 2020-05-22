json.array! @gameboards do |gb|
	if current_user 
	json.id gb.id
	json.username gb.username
	# json.pk gb.gameboard.kill.starts_at_time_of_pk
	json.pk gb.gameboard.kill
 	json.karma gb.gameboard.karma
	end
end