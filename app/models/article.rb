class Article < ApplicationRecord
  validates :author_id, :image, presence: true
  validates :title, presence: true, length: { minimum: 10, maximum: 100 }
  validates :text, presence: true, length: { minimum: 50, maximum: 1000 }

  belongs_to :author, class_name: 'User'
  has_many :votes

  has_many :article_categories
  has_many :categories, through: :article_categories, source: :category

  scope :most_voted, -> { order(:title).first }

  def self.most_recents
    Article.order(created_at: :desc)
  end
end
