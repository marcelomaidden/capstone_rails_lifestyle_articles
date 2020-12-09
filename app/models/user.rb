class User < ApplicationRecord
  validates :name, :username, presence: true

  has_many :articles, foreign_key: :author_id, source: :articles
  has_many :votes

  def self.myself?(user_id, logged_user)
    @user = User.find(user_id)
    return false unless @user.id != logged_user
  end
end
