module ArticlesHelper
  def show_articles(category)
    article = category.most_recent_article[0]
    return  article if params[:user_id].nil?
    return nil if article.nil?
    return article if article.author_id.to_i == params[:user_id].to_i
  end
end
