class Gameboard < ApplicationRecord
	rolify
	belongs_to :user
	has_one :kill 
	# has_many :votes, as: :voteable
	has_many :users, -> { distinct }, :through => :votes
end
