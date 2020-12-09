module ArticlesHelper
  def show_articles(category)
    article = category.most_recent_article[0]
    render partial: 'no-article', locals: {} if article.blank?
    render partial: 'article', locals: { :article => article, :category => category} if !article.blank?
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

  def article_blank?(categories, most_voted)
    if !most_voted.blank? 
      render partial: 'index', locals: { :categories => categories, :most_voted => most_voted }
    else
      render partial: 'no-article', locals: {}
    end     
  end

  def articles_by_category(article, category, count)
    if !article.blank? 
      render partial: 'categories/article-category', 
      locals: { :category => category, :article => article, :count => count }
    else
      render partial: 'categories/no-article-category', locals: { :category => category, :count => count }
    end
  end
end
