class ArticlesController < ApplicationController
  before_action :find_categories, only: %i[new create]
  before_action :user_loggedin?, only: %i[update create new edit]
  before_action :mine?, only: %i[edit update]
  before_action :find_article, only: %i[show edit update]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: article_params['title'], text: article_params['text'],
                           author_id: session[:current_user]['id'], image: article_params['image'])

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
    @article.image = article_params[:image]

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

    @articles = User.find(params[:user_id]).articles
    @most_voted = if @articles.most_voted.blank?
                    nil
                  else
                    @articles.most_voted
                  end
  end

  def articles_by_category
    return unless params[:category_id]
    @category = Category.find(params[:category_id])
    @articles = @category.articles.most_recents
    redirect_to root_path, notice: 'There are not articles on this category yet' if @articles.blank?
    render 'categories/articles' unless @articles.blank?
  end

  def article_params
    params.require(:article).permit(:title, :text, :image, categories: [])
  end

  def find_categories
    @categories = Category.all.order(:name)
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

  def mine?
    @article = Article.find(params[:id])
    return false unless @article.author.id != session[:current_user]['id']

    redirect_to root_path, notice: 'User is not allowed to edit this article'
  end
end
