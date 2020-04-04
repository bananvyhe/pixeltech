class Item < ApplicationRecord
	acts_as_list
	belongs_to :user 
	belongs_to :item_attribute 
end