module ArticlesHelper
  def show_articles(category)
    article = category.most_recent_article[0]
    return article if params[:user_id].nil?
    return nil if article.nil?
  end
  
  def article_owner?(article)
    return 'd-flex' if !session[:current_user].nil? && !article.nil? &&
      session[:current_user]['id'] == article.author.id 
    'd-none'
  end

  def article_image(article)
    return article.image if !article.blank?
    ""
  end
end
