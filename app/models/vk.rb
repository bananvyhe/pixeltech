class Vk < ApplicationRecord
	belongs_to :groupsvk
	has_many :appointments
	has_many :users, :through => :appointments
end
