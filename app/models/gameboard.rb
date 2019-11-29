class Gameboard < ApplicationRecord
	belongs_to :user
	# has_many :votes, as: :voteable
	has_many :users, -> { distinct }, :through => :votes
end
