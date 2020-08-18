 
	json.array! @vks do |vks|
		json.key vks.id
		json.label vks.namegroup.gsub("https://vk.com/", "")
		json.disabled false
	end
	# json.id vks.id
	# json.title vks.title
	# json.medias_row vks.medias_row
	# json.raiting vks.raiting
	# json.v_like vks.v_like
	# json.wall vks.wall
	# json.thumb_map_img_as_div vks.thumb_map_img_as_div
	# json.posted_at vks.posted_at
	# if current_user 
	# 	json.currentUser current_user.id  
	# 	json.user  vks.users.where(:id => current_user.id), :id 
	# end
 