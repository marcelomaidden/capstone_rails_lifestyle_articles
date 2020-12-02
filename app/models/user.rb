class User < ApplicationRecord
  validates :name, :username, presence: :true

  has_many :articles, foreign_key: :author_id, source: :articles 
  has_many :votes

end
