class Article < ApplicationRecord
  validates :author_id, :image, presence: true
  validates :title, presence: true, length: { minimum: 10, maximum: 100 }
  validates :text, presence: true, length: { minimum: 50, maximum: 1000 }

  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy

  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories, source: :category

  def self.most_voted
    if !Vote.all.blank?
      top = joins(:votes).group(:article_id).count.max_by do |_k, v|
        v
      end[0]

      Article.find(top)
    else
      Article.find(1)
    end
  end

  def self.most_voted_by(user)
    return nil if Article.find_by(author_id: user).blank?

    user = User.find(user)
    votes = user.articles.joins(:votes).group('articles.id')
    top = votes.count.max_by do |_k, v|
      v
    end[0]

    Article.find(top)
  end

  def self.most_recents
    Article.order(created_at: :desc)
  end

  def self.search(title)
    @articles = Article.where('lower(title) LIKE ?', "%#{title.downcase}%")
    @articles = @articles.includes(:author, :article_categories, :categories).order(created_at: :desc)
  end


  def self.mine?(article_id, logged_user)
    article = Article.find(article_id)
    return true unless article.author.id != logged_user
  end
end
