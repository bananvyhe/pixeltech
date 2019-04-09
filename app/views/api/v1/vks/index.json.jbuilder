# json.id @vks.ids
# json.title @vks.title
json.array! @vks do |vks|
	json.id vks.id
	json.title vks.title
	json.medias_row vks.medias_row
	json.raiting vks.raiting
	json.v_like vks.v_like
	json.thumb_map_img_as_div vks.thumb_map_img_as_div
	json.wall vks.wall
	# json.currentUser current_user.id
	# json.user  vks.users.find(vks.user_ids)
end