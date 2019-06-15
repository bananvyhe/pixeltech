class Vk < ApplicationRecord
	has_one :groupsvk
	has_many :appointments
	has_many :users, :through => :appointments
end
