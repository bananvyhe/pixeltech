class MyItem < ApplicationRecord
	validates :item_attribute_id, uniqueness: true
	acts_as_list
	belongs_to :user 
	belongs_to :item_attribute 
end