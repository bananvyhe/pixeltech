class Appointment < ApplicationRecord
	belongs_to :vk
	belongs_to :user
end