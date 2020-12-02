class User < ApplicationRecord
  validates :name, :username, presence: :true
end
