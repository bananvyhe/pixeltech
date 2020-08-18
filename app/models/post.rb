class Post < ApplicationRecord
	has_many :comments, :as => :commentable, :dependent => :delete_all
	belongs_to :user
	has_many :votes, as: :voteable
end