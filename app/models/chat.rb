class Chat < ApplicationRecord
	belongs_to :user
 	# belongs_to :clan
 	belongs_to :role
end
