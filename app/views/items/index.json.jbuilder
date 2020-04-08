json.array! @items do |i|
	if current_user 
		json.qty i.qty
		json.position i.position
		json.user_id i.user_id
	 	json.item_name i.item_attribute.item_name
	 	json.description i.item_attribute.description
	 	json.image i.item_attribute.image
	end
end