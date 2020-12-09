class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def self.suggestions(user_id)
    vote = Vote.select(:article_id).where(user_id: user_id).includes(:article)
    articles_category = ArticleCategory.where(article_id: vote).includes(:article, :category)
    categories = articles_category.pluck(:category_id)
    @articles = Article.includes(:article_categories, :categories, :author)
    @articles = @articles.where('article_categories.category_id': categories)
  end
end
