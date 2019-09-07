class Gameboard < ApplicationRecord
	belongs_to :user
	has_many :votes
	has_many :users, -> { distinct }, :through => :votes
end
