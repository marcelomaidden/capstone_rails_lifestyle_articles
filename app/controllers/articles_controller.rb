class ArticlesController < ApplicationController
  before_action :find_categories, only: %i[new create]
  before_action :user_loggedin?, only: %i[update create new edit]
  before_action :find_article, only: %i[show edit update]
  before_action :validate_categories, only: %i[create update]

  def new
    @article = Article.new
  end

  def edit
    return if Article.mine?(params[:id], session[:current_user]['id'])

    redirect_to root_path, notice: 'User is not allowed to edit this article'
  end

  def create
    @article = Article.new(title: article_params['title'], text: article_params['text'],
                           author_id: session[:current_user]['id'], photo: article_params['photo'])

    if @article.save
      add_categories
      redirect_to articles_path, notice: 'Article successfully created'
    else
      render new_article_path
    end
  end

  def update
    @article.title = article_params[:title]
    @article.text = article_params[:text]
    @article.photo = article_params[:photo]

    if @article.save
      @article.categories.delete_all
      add_categories
      redirect_to articles_path, notice: 'Article sucessfully updated'
    else
      render article_path(@article)
    end
  end

  def index
    @categories = Category.priority_order

    articles_by_user_id

    articles_by_category

    articles_common
  end

  def search
    @articles = Article.search(search_params[:title])
    if @articles.blank?
      redirect_to root_path, notice: 'Article not found'
    else
      render 'articles/search'
    end
  end

  def suggestions
    @articles = Vote.suggestions(session[:current_user]['id'])

    render 'suggestions'
  end

  private

  def articles_common
    @most_voted = if Article.all.blank?
                    nil
                  else
                    Article.most_voted.nil? ? nil : Article.most_voted
                  end
  end

  def articles_by_user_id
    return unless params[:user_id]

    @articles = User.find(params[:user_id]).articles.order(created_at: :desc)

    render 'users/articles'
  end

  def articles_by_category
    return unless params[:category_id]

    @category = Category.find(params[:category_id])
    @articles = @category.articles.most_recents.includes([:author])
    if @articles.blank?
      redirect_to root_path, notice: 'There are no articles on this category yet'
    else
      render 'categories/articles'
    end
  end

  def article_params
    params.require(:article).permit(:title, :text, :photo, categories: [])
  end

  def search_params
    params.require(:article).permit(:title)
  end

  def find_categories
    @categories = Category.all.order(:name)
  end

  def validate_categories
    if article_params[:categories][0].blank?
      redirect_to articles_path, notice: "Article not saved. Please add a category" unless article_params[:categories][1]
    end
  end

  def find_article
    @article = Article.find(params[:id])
    find_categories
  end

  def user_loggedin?
    redirect_to login_path if session[:current_user].nil?
  end

  def add_categories
    error = []
    categories = article_params['categories'][1..]
    categories.each do |category|
      @article_category = ArticleCategory.create(category_id: category, article_id: @article.id)
      error << @article_category.validate! unless @article_category.validate
    end

    redirect_to articles_path, notice: error if error.any?
  end
end
