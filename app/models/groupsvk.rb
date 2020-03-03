class Groupsvk < ApplicationRecord
	has_many :visiblegroups
  has_many :users, :through => :visiblegroups
end
