module ArticlesHelper
  def show_articles(category)
    article = category.most_recent_article[0]
    return article if params[:user_id].nil?
    return nil if article.nil?
  end
end
