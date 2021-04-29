module ArticlesHelper
  def show_articles(category)
    article = category.most_recent_article[0]
    render partial: 'no-article', locals: {} if article.blank?
    render partial: 'article', locals: { article: article, category: category } unless article.blank?
  end

  def article_owner?(article)
    return 'd-flex' if !session[:current_user].nil? && !article.nil? &&
                       session[:current_user]['id'] == article.author.id

    'd-none'
  end

  def articles_by_category(article, category, count)
    if !article.blank?
      render partial: 'categories/article-category',
             locals: { category: category, article: article, count: count }
    else
      render partial: 'categories/no-article-category', locals: { category: category, count: count }
    end
  end

  def articles_grid(articles, category)
    count = 0
    grid = ''
    articles.each do |article|
      grid += articles_by_category(article, category, count)
      count += 1
      count = 0 if count == 4
    end
    grid.html_safe
  end

  def article_image(article)
    return url_for(article.photo) unless article.blank?

    ''
  end

  def allowed_to_create?
    return link_to 'Create you own article', new_article_path unless session[:current_user].nil?

    ''
  end

  def edit_article?(article)
    if !session[:current_user].nil? && session[:current_user]['id'] == article.author.id
      return link_to 'Edit', edit_article_path(article).html_safe
    end

    'You are not the owner'
  end

  def article_blank?(categories, most_voted)
    if !most_voted.blank?
      render partial: 'index', locals: { categories: categories, most_voted: most_voted }
    else
      render partial: 'no-article', locals: {}
    end
  end
end
