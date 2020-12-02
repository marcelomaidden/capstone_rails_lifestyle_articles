class Article < ApplicationRecord
  validates :author_id, :image, presence: true
  validates :title, presence: true, length: { minimum: 10, maximum: 20 }
  validates :text, presence: true, length: { minimum: 100, maximum: 500 }

  belongs_to :author, class_name: 'User'
  has_many :votes

  has_many :article_categories
  has_many :categories, through: :article_categories, source: :category
end
