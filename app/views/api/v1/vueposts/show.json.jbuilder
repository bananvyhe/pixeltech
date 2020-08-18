if current_user 
	json.id @post.id	
	json.title @post.title
 	json.body @post.body 
 	json.username @post.user.username
 	json.clan_name @post.clan_name
end
 